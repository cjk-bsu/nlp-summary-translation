#!/bin/bash

ENV=$1
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ -z "$ENV" ]]; then
  echo "[ERROR] No environment specified. Usage: $0 <env>"
  exit 1
fi

if [[ "$ENV" != "aws" ]]; then
  echo "[ABORTED] This script is restricted to production deploys only. '$ENV' is not allowed."
  exit 1
fi

source "$DIR/common.sh"
source "$DIR/set_env.sh" "$ENV"

log "Deploying backend to environment: $ENV"

check_env_var AWS_REGION
check_env_var AWS_ACCOUNT_ID
check_env_var BACKEND_ECR_REPO_NAME
check_env_var CLUSTER_NAME
check_env_var SERVICE_NAME

cd "$DIR/../../webapp/backend"

IMAGE_TAG="latest"
ECR_URI="${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${BACKEND_ECR_REPO_NAME}"

log "Building Docker image..."
docker build -t $BACKEND_ECR_REPO_NAME .

log "Tagging image..."
docker tag $BACKEND_ECR_REPO_NAME:latest $ECR_URI:$IMAGE_TAG

log "Logging into ECR..."
aws ecr get-login-password --region $AWS_REGION \
  | docker login --username AWS --password-stdin $ECR_URI

log "Pushing image to ECR..."
docker push $ECR_URI:$IMAGE_TAG

log "Triggering ECS deployment..."
aws ecs update-service \
  --cluster $CLUSTER_NAME \
  --service $SERVICE_NAME \
  --force-new-deployment \
  --region $AWS_REGION

log "Backend deployed successfully."

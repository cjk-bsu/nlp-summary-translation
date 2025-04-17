#!/bin/bash

ENV=${1:-dev}
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$DIR/common.sh"
source "$DIR/set_env.sh" "$ENV"

log "Deploying frontend to environment: $ENV"

check_env_var AWS_REGION
check_env_var S3_BUCKET_NAME
check_env_var CLOUDFRONT_DISTRIBUTION_ID

cd "$DIR/../../webapp/frontend"

log "Installing frontend dependencies..."
npm install

log "Building frontend..."
npm run build || abort "Build failed"

log "Syncing to S3 bucket..."
aws s3 sync dist/ s3://$S3_BUCKET_NAME/ --delete --region $AWS_REGION

log "Invalidating CloudFront cache..."
aws cloudfront create-invalidation \
  --distribution-id $CLOUDFRONT_DISTRIBUTION_ID \
  --paths "/*" \
  --region $AWS_REGION

log "Frontend deployed successfully."

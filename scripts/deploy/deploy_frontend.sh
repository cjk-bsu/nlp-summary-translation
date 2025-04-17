#!/bin/bash
source "$(dirname "$0")/common.sh"

log "Deploying frontend..."

# Load env if needed
source "$(dirname "$0")/set_env.sh" "$1"

check_env_var AWS_REGION
check_env_var S3_BUCKET_NAME

cd ../../webapp/frontend || abort "Frontend not found"
npm install
npm run build || abort "Frontend build failed"

log "Uploading to S3..."
aws s3 sync dist/ s3://$S3_BUCKET_NAME/ --delete

log "Invalidating CloudFront cache..."
aws cloudfront create-invalidation \
  --distribution-id $CLOUDFRONT_DISTRIBUTION_ID \
  --paths "/*"

log "Frontend deployed successfully."

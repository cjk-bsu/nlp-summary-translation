# #!/bin/bash

# ENV_NAME=$1
# ENV_FILE=".env.$ENV_NAME"

# if [[ ! -f "$ENV_FILE" ]]; then
#   echo "[ERROR] Missing environment file: $ENV_FILE"
#   exit 1
# fi

# log() {
#   echo "[`date '+%Y-%m-%d %H:%M:%S'`] $1"
# }

# log "Loading environment: $ENV_FILE"
# export $(grep -v '^#' "$ENV_FILE" | xargs)

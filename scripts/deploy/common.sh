#!/bin/bash

set -e
set -o pipefail

log() {
  echo "[`date '+%Y-%m-%d %H:%M:%S'`] $1"
}

abort() {
  echo "[ERROR] $1"
  exit 1
}

check_env_var() {
  VAR_NAME=$1
  if [[ -z "${!VAR_NAME}" ]]; then
    abort "$VAR_NAME is not set in environment."
  fi
}

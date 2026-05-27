#!/bin/bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <tag>"
  exit 1
fi

IMAGE_NAME=foundryvtt
TAG="${1}"
MAJOR_TAG="${TAG%.*}"

docker tag "${IMAGE_NAME}:${TAG}" "${IMAGE_NAME}:${MAJOR_TAG}"
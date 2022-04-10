#!/bin/bash
set -euo pipefail

IMAGE_NAME=$(cat IMAGENAME)
IMAGE_TAG=$(cat BUILDTAG)

docker run \
  --rm \
  -ti \
  --name foundryvtt \
  -h foundryvtt-test \
  -p 30000:30000 \
  -v $(pwd)/data:/var/foundryvtt/data \
  "${IMAGE_NAME}:${IMAGE_TAG}"

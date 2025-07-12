#!/bin/bash
set -euo pipefail

IMAGE_NAME=$(cat IMAGENAME)
IMAGE_TAG=$(cat BUILDTAG)
#IMAGE_TAG=13.346

docker run \
  --rm \
  -ti \
  --name foundryvtt \
  -h foundryvtt-test \
  -p 30000:30000 \
  -v $(pwd)/data:/var/foundryvtt/data \
  "${IMAGE_NAME}:${IMAGE_TAG}"


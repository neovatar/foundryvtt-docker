#!/bin/bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <foundry-version>"
  exit 1
fi

IMAGE_NAME=foundryvtt
FOUNDRY_UID=$(id -u foundry || echo 1000)
FOUNDRY_GUID=$(id -g foundry || echo 1000)
FVTT_VERSION=${1}

UUID=$(cat /proc/sys/kernel/random/uuid)

docker build \
  --pull \
  --no-cache=true \
  --build-arg "FVTT_VERSION=${FVTT_VERSION}" \
  --build-arg "FVTT_UID=${FOUNDRY_UID}" \
  --build-arg "FVTT_GUID=${FOUNDRY_GUID}" \
  -t "${IMAGE_NAME}:${UUID}" .

docker tag "${IMAGE_NAME}:${UUID}" "${IMAGE_NAME}:${FVTT_VERSION}"
docker rmi "${IMAGE_NAME}:${UUID}"



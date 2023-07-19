#!/bin/bash
set -euo pipefail

IMAGE_NAME=foundryvtt
FOUNDRY_UID=$(id -u foundry || echo 1000)
FOUNDRY_GUID=$(id -g foundry || echo 1000)

UUID=$(cat /proc/sys/kernel/random/uuid)

docker build \
  --pull \
  --no-cache=true \
  --build-arg "FVTT_UID=${FOUNDRY_UID}" \
  --build-arg "FVTT_GUID=${FOUNDRY_GUID}" \
  -t "${IMAGE_NAME}:${UUID}" .

IMAGE_TAG=$(docker inspect "${IMAGE_NAME}:${UUID}" | jq -r '.[0] | .Config.Labels.fvtt_version')
docker tag "${IMAGE_NAME}:${UUID}" "${IMAGE_NAME}:${IMAGE_TAG}"
docker rmi "${IMAGE_NAME}:${UUID}"

echo "${IMAGE_NAME}" > IMAGENAME
echo "${IMAGE_TAG}" > BUILDTAG

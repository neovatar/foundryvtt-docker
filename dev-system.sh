#!/bin/bash
set -euo pipefail

IMAGE_NAME=$(cat IMAGENAME)
IMAGE_TAG=$(cat BUILDTAG)

# docker run \
#   --rm \
#   -ti \
#   --name foundryvtt \
#   -h foundryvtt-test \
#   -p 30000:30000 \
#   -v $(pwd)/data:/var/foundryvtt/data \
#   "${IMAGE_NAME}:${IMAGE_TAG}"

docker run \
--rm \
-ti \
--name foundryvtt \
-h foundryvtt-test \
-p 30000:30000 \
-v $(pwd)/data:/var/foundryvtt/data \
-v $(pwd)/../neon-city-overdrive-unofficial:/var/foundryvtt/data/Data/systems/neon-city-overdrive-unofficial \
-v $(pwd)/../FUx-Dice-Roller:/var/foundryvtt/data/Data/modules/fux-dice-roller \
"${IMAGE_NAME}:${IMAGE_TAG}"

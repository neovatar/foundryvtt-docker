#!/bin/bash
set -euo pipefail

IMAGE_NAME=foundryvtt
IMAGE_TAG=${1:-13}

docker run \
--rm \
-ti \
--name foundryvtt \
-h foundryvtt-test \
-p 30000:30000 \
-v $(pwd)/data:/var/foundryvtt/data \
-v $(pwd)/../neon-city-overdrive-unofficial:/var/foundryvtt/data/Data/systems/neon-city-overdrive-unofficial \
-v $(pwd)/../FUx-Dice-Roller:/var/foundryvtt/data/Data/modules/fux-dice-roller \
-v $(pwd)/../more-text-options:/var/foundryvtt/data/Data/modules/more-text-options \
"${IMAGE_NAME}:${IMAGE_TAG}"

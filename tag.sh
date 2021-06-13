#!/bin/bash
set -euo pipefail

IMAGE_NAME=$(cat IMAGENAME)
IMAGE_TAG=$(cat BUILDTAG)

docker tag "${IMAGE_NAME}:${IMAGE_TAG}" "${IMAGE_NAME}:latest"
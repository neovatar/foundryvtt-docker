#!/bin/bash
set -euo pipefail

DEST_DIR=/var/docker/build/foundryvtt
SSH_DEST="${1:-spike}"

echo "=> rsync"
echo "   src: $(pwd)"
echo "   dst: $SSH_DEST:$DEST_DIR"
rsync -rlptgo \
  --delete \
  --delete-excluded \
  --exclude='/.git' \
  --filter="dir-merge,- .gitignore" \
 . $SSH_DEST:$DEST_DIR
 
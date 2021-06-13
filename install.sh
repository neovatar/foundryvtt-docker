#!/bin/bash
set -euox pipefail

INSTANCE=${1:-rpg}
FVTT_DATA_DIR=/var/foundryvtt-${INSTANCE}/data

id -u foundry || adduser --gecos "" --disabled-password --no-create-home --home /var/www/empty foundry
mkdir -p "${FVTT_DATA_DIR}"
chown foundry:foundry "${FVTT_DATA_DIR}"

cp "foundryvtt-${INSTANCE}.service" "/etc/systemd/system/foundryvtt-${INSTANCE}.service"
systemctl daemon-reload
systemctl enable "foundryvtt-${INSTANCE}.service"

#!/bin/bash
set -euox pipefail

cp "ddb-proxy.service" "/etc/systemd/system/ddb-proxy.service"
systemctl daemon-reload
systemctl enable "ddb-proxy.service"

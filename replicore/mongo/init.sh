#!/usr/bin/env bash
set -e


echo "==> Checking (and initialising) mongo replica set ..."
mongo --norc /replicore/init-rs.js

echo "==> Ensuring all mongo indexes exist ..."
mongo --norc /replicore/indexes.js

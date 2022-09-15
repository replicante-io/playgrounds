#!/bin/bash
set -e

while [ ! -e /home/replicante/initialised.mark ]; do
  echo "Waiting for initialisation ..."
  sleep 1
done

exec /opt/replicante/bin/replicante

#!/bin/sh

# Wait for consul to become available.
echo "==> Waiting for consul nodes to be up ..."
sleep 30


# Check and initialise (if needed).
echo "==> Checking for cluster initialisation ..."
peers=$(curl -v http://node1:8500/v1/status/peers)
if [ "${peers}" == "[]" ]; then
  echo "==> Cluster needs initialisation ..."
  consul join --http-addr=http://node1:8500 node1 node2 node3
else
  echo "==> Cluster already initialised"
fi

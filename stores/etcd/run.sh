#!/bin/sh

CLUSTER_ID=$1
MODE=$2
NODE_NAME=$3
STORE_PORT=$4

EXIST_MASTER_NAME=$5
EXIST_MASTER_PORT=$6

if [ "$MODE" = "new" ]; then
  echo "Starting single-node cluster ..."
  exec etcd \
    --name "$NODE_NAME" \
    --data-dir /persist/data \
    --wal-dir /presist/wal \
    --initial-advertise-peer-urls "http://host.containers.internal:$STORE_PORT" \
    --initial-cluster-state new \
    --initial-cluster-token "$CLUSTER_ID" \
    --initial-cluster "$NODE_NAME=http://host.containers.internal:$STORE_PORT"

else
  echo "Starting additional member ..."
  etcdctl --endpoints "host.containers.internal:$EXIST_MASTER_PORT" member add $NODE_NAME --peer-urls=http://host.containers.internal:$STORE_PORT

  exec etcd \
    --name "$NODE_NAME" \
    --data-dir /persist/data \
    --wal-dir /presist/wal \
    --initial-advertise-peer-urls "http://host.containers.internal:$STORE_PORT"
    --initial-cluster-token "$CLUSTER_ID" \
    --initial-cluster "$EXIST_MASTER_NAME=http://host.containers.internal:$EXIST_MASTER_PORT"
fi

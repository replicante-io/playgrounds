#!/bin/bash
#  See https://docs.mongodb.com/manual/tutorial/deploy-shard-cluster/
echo "Waiting for all nodes to start ..."
sleep 30

echo "Checking (and initialising) config replica set ..."
mongo --norc --host config1 --port 27019 /files/init.config.js

echo "Checking (and initialising) shard1 replica set ..."
mongo --norc --host shard1n1 --port 27018 /files/init.shard1.js

echo "Checking (and initialising) shard2 replica set ..."
mongo --norc --host shard2n1 --port 27018 /files/init.shard2.js


echo "Waiting for all replica sets to elect a primary ..."
sleep 10

echo "Checking (and initialising) shards ..."
mongo --norc --host mongos /files/init.shards.js

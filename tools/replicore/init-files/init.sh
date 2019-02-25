#!/bin/bash

echo "Waiting for nodes to start ..."
sleep 30

echo "Checking (and initialising) mongo replica set ..."
mongo --norc --host mongo /files/init.js

echo "Ensuring all mongo indexes exist ..."
mongo --norc --host mongo /files/indexes.js

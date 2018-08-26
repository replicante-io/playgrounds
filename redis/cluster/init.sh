#!/bin/bash

# Install redis-trib.rb
apt-get update
apt-get install -y dnsutils ruby wget
gem install redis

[ -f /usr/local/bin/redis-trib.rb ] || \
  wget -O /usr/local/bin/redis-trib.rb \
    https://raw.githubusercontent.com/antirez/redis/4.0.10/src/redis-trib.rb
chmod +x /usr/local/bin/redis-trib.rb

if redis-cli -h node1 CLUSTER INFO | grep 'cluster_known_nodes:1'; then
  echo 'yes' | redis-trib.rb create --replicas 2 \
    $(dig +short node1):6379 \
    $(dig +short node2):6379 \
    $(dig +short node3):6379 \
    $(dig +short node4):6379 \
    $(dig +short node5):6379 \
    $(dig +short node6):6379 \
    $(dig +short node7):6379 \
    $(dig +short node8):6379 \
    $(dig +short node9):6379
fi

# Keep the controller container up for users to have redis-trib.rb
while true; do
  sleep 5
done

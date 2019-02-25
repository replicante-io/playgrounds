#!/bin/bash
echo "===> Waiting for postgres to be up ..."
sleep 15


echo "===> Checking DB existence ..."
if ! psql -U postgres nss 2> /dev/null; then
  echo "===> Initalising DB ..."
  apt-get update
  apt-get install -y wget
  wget https://raw.githubusercontent.com/nats-io/nats-streaming-server/v${NATS_VERSION}/postgres.db.sql
  psql -U postgres --host database --command 'CREATE DATABASE nss;'
  psql -U postgres --host database nss < postgres.db.sql
fi
echo "===> Done"

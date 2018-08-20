#!/bin/bash
echo "===> Delaying start ..."
sleep 60

echo "===> Starting now ..."
exec "$@"

#!/bin/bash

# Inject CLUSTER_ID into agent config.
cat /opt/replicante/agent-zookeeper.template.yaml \
  | sed "s/'INJECTED_CLUSTER_ID'/'${CLUSTER_ID}'/" \
  > /home/replicante/agent-zookeeper.yaml

# Start the Replicante Agent.
exec replicante-agent-zookeeper --config /home/replicante/agent-zookeeper.yaml

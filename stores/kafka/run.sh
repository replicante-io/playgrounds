#!/bin/bash

# Inject CLUSTER_ID into agent config.
cat /opt/replicante/agent-kafka.template.yaml \
  | sed "s/'INJECTED_CLUSTER_ID'/'${CLUSTER_ID}'/" \
  > /home/replicante/agent-kafka.yaml

# Start the Replicante Agent.
exec replicante-agent-kafka --config /home/replicante/agent-kafka.yaml

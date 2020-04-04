#!/bin/bash

# Inject CLUSTER_ID into agent config.
cat /opt/replicante/agent-mongodb.template.yaml \
  | sed "s/'INJECTED_CLUSTER_ID'/'${CLUSTER_ID}'/" \
  > /home/replicante/agent-mongodb.yaml

# Start the Replicante Agent.
exec replicante-agent-mongodb --config /home/replicante/agent-mongodb.yaml

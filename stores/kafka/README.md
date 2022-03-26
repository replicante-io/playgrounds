# Kafka

> Remember: Pods (nodes) can only access each others through the podman host,
> accessible within pods with the `host.containers.internal` DNS name.

## TLS Certificates

TLS certificates are used by the agents API.
They are required to enable the actions engine.

```bash
# Generate TLS certificates for servers and clients.
# This command does nothing if certs already exist so it is safe to run many time.
$ replidev gen-certs
```

## Start a cluster

You will need a running zookeeper instance for the kafka cluster to run.
Because this are test clusters, a single zookeeper instance running on the podman host is expected:

```bash
$ podman run --rm -it \
  --publish 2181:2181 --publish 2888:2888 --publish 3888:3888 --publish 8080:8080 \
  zookeeper:3.6
```

To start nodes:

```bash
$ replidev play node-start kafka
--> Starting kafka node play-node-jYQOOV38 for cluster kafka
--> Create pod play-node-jYQOOV38
0e63ceb26277eb0f58f7c159f2878839b2559864de778d265636c6165f429d4d
--> Start container play-node-jYQOOV38-kafka
79757584228f15cb66a0add9bd6e434ea683dfa793a6b34c677cb3244914ae79
--> Start container play-node-jYQOOV38-repliagent
222bcf70752ffacd72b0c3296e08d4ca47c6e0345df3cb0050e3a33db6925138

$ replidev play node-list
NODE                 CLUSTER   STORE PORT   CLIENT PORT   AGENT PORT   STATUS    POD ID  
play-node-jYQOOV38   kafka     10000        10000         10001        Running   0e63ceb26277

# To add new nodes just start them:
$ replidev play node-start kafka
...
```

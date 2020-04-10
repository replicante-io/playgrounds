# Zookeeper
> Remember: Pods (nodes) can only access each others through the podman host,
> accessible within pods with the `podman-host` DNS name.


## TLS Certificates
TLS certificates are used by the agents API.
They are required to enable the actions engine.

```bash
# Generate TLS certificates for servers and clients.
# This command does nothing if certs already exist so it is safe to run many time.
$ replidev gen-certs
```


## Start a cluster
Zookeeper makes dynamic clusters quite the pain because it requires servers
to be enumerated, IP and ports, into each node's configuration.

Because this is a development/test tool we work around this by describing the
nodes in the cluster in a JSON file.
This works because `replidev play` has a fairly predictable way to assign ports:

  * Starting from the base of the range (10000 by default).
  * Use each port that is not currently in use.
  * Allocating them in the `ports` order in the pod definition.

> NOTE: this example assumes some ports are available as specified in the cluster JSON file.
> If they are not, this example will fail.

```bash
$ replidev play node-start zookeeper --var-file 'cluster=stores/zookeeper/cluster.example.json' --var 'my_id=0'
--> Starting zookeeper node play-node-baNihVr2 for cluster zookeeper
--> Create pod play-node-baNihVr2
cec25bbbd8d154d8d20a46188fe3739abe8033e7e9ef61fbd18d5547f100aa8f
--> Start container play-node-baNihVr2-zookeeper
e7b9cb80b70072c96d5329e5d52fb938c6728f5d1ad2ecbb74633c785f6aa614
--> Start container play-node-baNihVr2-repliagent
99a060eb3477b22c19c63225695d27efaefefc72518d9bd506e93ab03201b005

# Add more nodes by changing my_id to 1 and, ONLY AFTER, to 2.
```

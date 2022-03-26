# Etcd

**NOTE**: Etcd clustering does not work at this moment.

This is because I can't get nodes to generate the same cluster ID so nodes reject each other.

> Remember: Pods (nodes) can only access each others through the podman host,
> accessible within pods with the `host.containers.internal` DNS name.

## Start a cluster

```bash
$ replidev play node-start etcd
--> Starting etcd node play-node-q3777CMd for cluster etcd
--> Create pod play-node-q3777CMd
1d7d2f1d4447a2fd87710e7a208b8ac57c72ee7b532d661bb19b4acfb06179b1
--> Start container play-node-q3777CMd-etcd
8b844706ab8493f4d149ee9b17d1ba0cd76c71f415d4a8c644245c15fa21c646

$ replidev play node-list
NODE                 CLUSTER   STORE PORT   CLIENT PORT   AGENT PORT   STATUS    POD ID
play-node-q3777CMd   etcd      10000        10001         -            Running   1d7d2f1d4447

# Wait for the node to start and bootstrap a one-node cluster.
# To add nodes once the cluster is running set the `join` variable
# to a running node already in the cluster:
$ replidev play node-start etcd --var 'join=$NODE_NAME=http://host.containers.internal:10000'
```

## Interact with the API

```bash
podman exec -it $NODE_NAME-etcd sh
export ETCDCTL_API=3
etcdctl endpoint status
```

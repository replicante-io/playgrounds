# Consul
> Remember: Pods (nodes) can only access each others through the podman host,
> accessible within pods with the `podman-host` DNS name.


## Start a cluster
```bash
$ replidev play node-start consul
--> Starting consul node play-node-3tCtH1AV for cluster consul
--> Create pod play-node-3tCtH1AV
77e0b71c560d28fa07771899bcf84c3ea4b8a346ed3be797637a110c046d99d9
--> Start container play-node-3tCtH1AV-consul
21d1760ca536c9d0e5c2065744d9fa0b758d1a7d9fe484f0c008c06d8f7f005d

$ replidev play node-list
NODE                 CLUSTER   STORE PORT   CLIENT PORT   AGENT PORT   STATUS    POD ID  
play-node-3tCtH1AV   consul    10000        10002         -            Running   77e0b71c560d

# Wait for the node to start and bootstrap a one-node cluster.
# To add nodes once the cluster is running set the `join` variable
# to a running node already in the cluster:
$ replidev play node-start consul --var join=podman-host:10000
```

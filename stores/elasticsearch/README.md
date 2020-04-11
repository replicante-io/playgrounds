# ElasticSearch
> Remember: Pods (nodes) can only access each others through the podman host,
> accessible within pods with the `podman-host` DNS name.


## Start a cluster
CrateDB nodes enforce fairly large limits to run.
Increaes the system limits to start nodes.
Don't forget to lower them again on your development system.
```bash
$ sysctl vm.max_map_count
vm.max_map_count = 65530
$ sudo sysctl vm.max_map_count=262144
vm.max_map_count = 262144

# Once done creating/running nodes
$ sudo sysctl vm.max_map_count=65530
vm.max_map_count = 65530
```

Now start the nodes:
```bash
$ replidev play node-start elasticsearch
--> Starting elasticsearch node play-node-V9xmZk9l for cluster elasticsearch
--> Create pod play-node-V9xmZk9l
ae2a7dfb35be295e5f7faaf76a709610a40e67384b805452ea998f6355d7335d
--> Start container play-node-V9xmZk9l-elasticsearch
58f236a615be96c1b0a34dce8ba930ca6ee99fb5ee9bd0e25a1e17c8f1f40083

$ replidev play node-list
NODE                 CLUSTER         STORE PORT   CLIENT PORT   AGENT PORT   STATUS    POD ID
play-node-V9xmZk9l   elasticsearch   10000        10001         -            Running   ae2a7dfb35be

$ replidev play node-start elasticsearch --var seed=10000
...
```

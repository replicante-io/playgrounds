# CrateDB

> Remember: Pods (nodes) can only access each others through the podman host,
> accessible within pods with the `host.containers.internal` DNS name.

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

Now start the first node and up to 2 more (on the free license):

```bash
$ replidev play node-start cratedb
--> Starting cratedb node play-node-Kl54dhXl for cluster cratedb
--> Create pod play-node-Kl54dhXl
e80e18d9720be50942c672ed2c63e5632adfb52d2a950632864824407d81ecfd
--> Start container play-node-Kl54dhXl-cratedb
1cec16174fa138e2bd18b6cd3293902c80c79f70785ec8aa4824c01ee19d72f5

$ replidev play node-list
NODE                 CLUSTER   STORE PORT   CLIENT PORT   AGENT PORT   STATUS    POD ID  
play-node-Kl54dhXl   cratedb   10000        10001         -            Running   e80e18d9720b

$ replidev play node-start cratedd --var seed=10000
...
```

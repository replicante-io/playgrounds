# PostgreSQL
PostgreSQL native replication features can be used to build many different
shapes of clusters and address many different needs.
On the other hand they are complex (and manual) to use out of the box.

Projects exists to build on the native features and provide a easier to use
and automated setup.
The Replicante project chose [stolon](https://github.com/sorintlab/stolon) to
create a replicated cluster.

> Remember: Pods (nodes) can only access each others through the podman host,
> accessible within pods with the `podman-host` DNS name.


## Start a cluster
Since stolon needs a store for the cluster configuration we first start a consul server:
```bash
$ podman run --rm -it --publish 8500:8500 --name consul consul:1.7
```

To start nodes:
```bash
$ replidev play node-start postgresql
--> Starting postgresql node play-node-ifaOzI41 for cluster postgresql
--> Create pod play-node-ifaOzI41
e14753e644d120a721b745997fbe66e870221bae2910c7307c281d6886ed340b
--> Start container play-node-ifaOzI41-sentinel
2459a7eabe3b4cfcebc4f4323cd2a0cf0f1d4e601c2d1ab850bb9d1eb3756813
--> Start container play-node-ifaOzI41-keeper
e99d0f16983df23e07b547a8e82071a92e36577520017b5be171179014ddc04f
--> Start container play-node-ifaOzI41-proxy
f8f05cde71cda73523568f0a1405e5ea53b377d1139cf7a8cfbf7153c2e71a9a

# Initialise the cluster.
$ podman exec -it $NODE-sentinel stolonctl init \
  --cluster-name postgresql \
  --store-backend consul --store-endpoints http://podman-host:8500 \
  --file /cluster-seed.json
WARNING: The databases managed by the keepers will be overwritten depending on the provided cluster spec.
Are you sure you want to continue? [yes/no] yes

# To add new nodes just start them:
$ replidev play node-start postgresql
...
```

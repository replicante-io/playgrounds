MongoDB Playgrounds
===================
Ensure the `replicante_playgrounds` network exists following README.md in the repo root.

Replica Set (3.2)
-----------------
From the repo root:

```bash
cd store/mongo/rs
docker-compose up
# The first time wait about 30 seconds for the controller
# container to initialise the replica set.
```

Sharded cluster (3.2)
---------------------
From the repo root:

```bash
cd store/mongo/sharded
docker-compose up
# The first time wait about 40 seconds for the controller
# container to initialise the replica set.
```

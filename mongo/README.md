MongoDB Playgrounds
===================

Replica Set (3.2)
-----------------
From the repo root:

```bash
cd mongo/rs
docker-compose up
# The first time wait about 30 seconds for the controller
# container to initialise the replica set.
```

Sharded cluster (3.2)
---------------------
From the repo root:

```bash
cd mongo/sharded
docker-compose up
# The first time wait about 40 seconds for the controller
# container to initialise the replica set.
```

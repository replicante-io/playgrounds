Playgrounds
===========
Playgrounds are docker and docker-compose projects that run distributed
datastores locally so that replicante can be developed and tested.


Datastores
----------

  * Consul
  * CouchDB (cluster)
  * CrateDB
  * ElasticSearch
  * Etcd
  * Kafka
  * MongoDB
  * NATS Streaming Server
  * PostgreSQL (stolon)
  * Redis (cluster)
  * Redis (sentinel)
  * Zookeeper

### Running agents
Datastore playgrounds support running replicante agents on the side.
The command line below can be used to start the datastore and the agents.

```bash
docker-compose -f docker-compose.yml -f docker-compose-agents.yml up
```

### Docker networks

  * 172.64.0.0/27:   MongoDB (Replica Set)
  * 172.64.0.32/27:  MongoDB (Sharded)
  * 172.64.0.64/27:  Zookeeper
  * 172.64.0.96/27:  Kafka
  * 172.64.0.128/27: Redis (cluster)
  * 172.64.0.160/27: Redis (sentinel)
  * 172.64.0.192/27: ElasticSearch
  * 172.64.0.224/27: PostgreSQL (stolon)
  * 172.65.0.0/27:   Consul
  * 172.65.0.32/27:  Etcd
  * 172.65.0.64/27:  NATS Streaming Server
  * 172.65.0.96/27:  CouchDB (cluster)
  * 172.65.0.128/27: CrateDB


Development tools
-----------------
This repo also stores some development support tools:

  * Replicore: a all-in-one replicante core setup.
  * [Zipkin](https://zipkin.io/): a distributed tracer.

### Docker networks

  * 172.32.0.0/27:  Replicore
  * 172.32.0.32/27: Zipkin

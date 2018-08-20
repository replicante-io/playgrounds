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
  * Zookeeper

### Running agents
Datastore playgrounds support running replicante agents on the side.
The command line below can be used to start the datastore and the agents.

```bash
docker-compose -f docker-compose.yml -f docker-compose-agents.yml up
```

### Docker networks

  * 172.65.0.0/24: MongoDB (Replica Set)
  * 172.66.0.0/24: MongoDB (Sharded)
  * 172.67.0.0/24: Zookeeper
  * 172.68.0.0/24: Kafka
  * 172.69.0.0/24: Redis (cluster)
  * 172.70.0.0/24: ElasticSearch
  * 172.71.0.0/24: PostgreSQL (stolon)
  * 172.72.0.0/24: Consul
  * 172.73.0.0/24: Etcd
  * 172.74.0.0/24: NATS Streaming Server
  * 172.75.0.0/24: CouchDB (cluster)
  * 172.76.0.0/24: CrateDB


Development tools
-----------------
This repo also stores some development support tools:

  * Zipkin distributed tracer.

Playgrounds
===========
Playgrounds are docker and docker-compose projects that run distributed
datastores locally so that replicante can be developed and tested.


Datastores
----------

  * MongoDB 3.x+, three nodes Replica Set configuration.
  * MongoDB 3.x+, 2x three nodes shards + three nodes config RS + one mongos
  * Zookeeper 3.4+, three nodes ensable + ZooNavigator

### Running agents
Datastore playgrounds support running replicante agents on the side.
The command line below can be used to start the datastore and the agents.

```bash
docker-compose -f docker-compose.yml -f docker-compose-agents.yml up
```

### Docker networks

  * 172.65.0.0/24: MongoDB 3.x+ Replica Set
  * 172.66.0.0/24: MongoDB 3.x+ Sharded
  * 172.67.0.0/24: Zookeeper 3.4+


Development tools
-----------------
This repo also stores some development support tools:

  * Zipkin distributed tracer.

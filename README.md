Playgrounds
===========
Playgrounds are docker and docker-compose projects that run distributed
datastores locally so that replicante can be developed and tested.


Datastores
----------

  * MongoDB 3.2, three nodes Replica Set configuration.

### Running agents
Datastore playgrounds support running replicante agents on the side.
The command line below can be used to start the datastore and the agents.

```bash
docker-compose -f docker-compose.yml -f docker-compose-agents.yml up
```


Development tools
-----------------
This repo also stores some development support tools:

  * Zipkin distributed tracer.

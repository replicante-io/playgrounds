Zipkin
======
An all-in-one [Zipkin](https://zipkin.io/) setup for local development.

Based on the [official docker-compose project](https://github.com/openzipkin/docker-zipkin).
Some changes were made and some services dropped to target the needs of Replicante.

To avoid issues related to docker networking NAT and randomly assigned IPs:

  * The compose project uses a fixed subnet: 172.32.0.32/27
  * Containers that run servers have fixed IPs so you know where to find them.

This means that containers in this docker-compose project are only
available locally (unless you fancy some advanced networking and routing).

Finally, data is always stored in docker volumes.


Known addresses
---------------

  * Zipkin WebUI: http://172.32.0.62/
  * Zipkin Kafka Broker: 172.32.0.61:19092


Advanced options
----------------
It is possible to create a `docker-compose-options.yml` file to customise the docker-compose project.
The `docker-compose-options.example.yml` contains example overrides to tune zipkin.

Use is by invoking:
```
docker-compose -f docker-compose.yml -f docker-compose-options.yml COMMAND
```

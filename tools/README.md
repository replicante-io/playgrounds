Development tools
=================

Zipkin
------
From the repo root:

```bash
git submodule update --checkout

# Make zipkin containers able to access kafka:
#   Set KAFKA_ADVERTISED_HOST_NAME=kafka-zookeeper
vim +15 tools/docker-zipkin/docker-compose-kafka10.yml

# Start zipkin and all dependences.
cd tools/docker-zipkin
docker-compose -f docker-compose.yml -f docker-compose-kafka10.yml -f docker-compose-ui.yml up

# Make your host able to access kafka:
#   Add kafka-zookeeper to your /etc/hosts file to resolve to localhost:
#     127.0.0.1    kafka-zookeeper
sudo vim /etc/hosts
```

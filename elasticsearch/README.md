ElasticSearch Playgrounds
=========================
From the repo root:
```bash
cd elasticsearch/
# ES cluster runs as UID=1000, make the needed dirs.
mkdir -p data/node{1,2,3}

# TODO
sysctl vm.max_map_count
sudo sysctl vm.max_map_count=262144
#sudo sysctl vm.max_map_count=<VALUE_FROM_FIRST_COMMAND|65530>

docker-compose up
```

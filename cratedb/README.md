CrateDB Playground
==================
From the repo root:
```bash
cd cratedb/

# CrateDB enforces bootstrap checks.
# To pass them and start, run the following:
sysctl vm.max_map_count
sudo sysctl vm.max_map_count=262144
#sudo sysctl vm.max_map_count=<VALUE_FROM_FIRST_COMMAND|65530>

docker-compose up
```

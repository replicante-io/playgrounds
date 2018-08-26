Redis Playgrounds
=================

## Cluster
From the repo root:
```bash
cd redis/cluster
docker-compose up
```

## Sentinel
From the repo root:
```bash
cd redis/sentinel

# The first time around seed config files.
cp redis.seed.conf redis1.conf
cp redis-replica.seed.conf redis2.conf
cp redis-replica.seed.conf redis3.conf
cp sentinel.seed.conf sentinel1.conf
cp sentinel.seed.conf sentinel2.conf
cp sentinel.seed.conf sentinel3.conf

# Ensure redis processes can update the config files.
chmod 666 redis{1,2,3}.conf sentinel{1,2,3}.conf

# Start the cluster.
docker-compose up
```

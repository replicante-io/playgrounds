Etcd Playgrounds
================
From the repo root:
```bash
cd etcd/
docker-compose up

# Interact with the API
docker-compose exec node1 sh
export ETCDCTL_API=3
etcdctl endpoint status
```

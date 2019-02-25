Etcd Playgrounds
================
Ensure the `replicante_playgrounds` network exists following README.md in the repo root.

Then, from the repo root:
```bash
cd stores/etcd/
docker-compose up

# Interact with the API
docker-compose exec node1 sh
export ETCDCTL_API=3
etcdctl endpoint status
```

Zookeeper Playgrounds
=====================
Ensure the `replicante_playgrounds` network exists following README.md in the repo root.

Then, from the repo root:
```bash
cd stores/zookeeper/
docker-compose up
# A ZooNavigator instance will be availabe at http://localhost:8000/
# Use `node[123]:2181` to connect to zookeeper from the UI.
```

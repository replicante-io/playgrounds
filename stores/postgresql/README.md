PostgreSQL Playgrounds
======================
PostgreSQL native replication features can be used to build many different
shapes of clusters and address many different needs.
On the other hand they are complex (and manual) to use out of the box.

Projects exists to build on the native fatures and provide a easier to use
and automated setup.
For this playground we use [stolon](https://github.com/sorintlab/stolon) to
create a replicated cluster.


Ensure the `replicante_playgrounds` network exists following README.md in the repo root.

Then, from the repo root:
```bash
cd stores/postgresql/
docker-compose up
```

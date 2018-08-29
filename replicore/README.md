Replicante Core
===============
Containers and configuration to run a replicante overseeing the other playgrounds.


Networks
--------
To gain access to all agents without using a single docker-compose file
projects use pre-configured networks with some static IPs.
These networks start from the `172.64.0.0/24` and up to reduce chances of conflicts.

The downside is that the compose project will not start if these networks do not extist.

Networks can be created without starting containers or images with `docker-compose up --no-build --no-start`.


Using
-----
```bash
cd replicantecore/
docker-compose up
```

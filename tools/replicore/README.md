# Replicante Core
Ensure the `replicante_playgrounds` network exists following README.md in the repo root.

Then, from the repo root:
```bash
cd tools/replicore/
docker-compose up
```

## Cluster Discovery
Replicante finds clusters to monitor using dynamic
[cluster discovery](https://www.replicante.io/docs/manual/docs/features-discovery/).
From Replicante v0.4 HTTP discovery is available to request the list of clusters
to any web server or application.

To make things easy and work out of the box, an HTTP webapp runs as part of this `replicore`
docker compose project to query all docker containers running playgroud agents.

Clusters are automatically discovered as soon as their compose project is started.
As this is a demo and testing tool and not a production service some limitations apply:

  * If playground containers exist but does not have a known IP.
  * If some agents/nodes are down for clusters that use dynamic IDs the webapp fails.

To fetch the cluster discoveries from this webapp `GET` or `POST` one of the following URLs:

  * http://172.64.255.184:5000/discover (from the docker host or containers in the `replicante_playgrounds` network).
  * http://127.0.0.1:5050/discover (from the docker host only).

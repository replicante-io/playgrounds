# Playgrounds
Playgrounds are docker and docker-compose projects that run distributed
datastores locally so that replicante can be developed, tested, and demoed.


## Code of Conduct
Our aim is to build a thriving, healthy and diverse community.  
To help us get there we decided to adopt the [Contributor Covenant Code of Conduct](https://www.contributor-covenant.org/)
for all our projects.

Any issue should be reported to [stefano-pogliani](https://github.com/stefano-pogliani)
by emailing [conduct@replicante.io](mailto:conduct@replicante.io).  
Unfortunately, as the community lucks members, we are unable to provide a second contact to report incidents to.  
We would still encourage people to report issues, even anonymously.

In addition to the Code Of Conduct below the following documents are relevant:

  * The [Reporting Guideline](https://www.replicante.io/conduct/reporting), especially if you wish to report an incident.
  * The [Enforcement Guideline](https://www.replicante.io/conduct/enforcing)


## Quick start
The following steps will get you up and running with a supported datastore as well as
an optional Replicante Core instance ready to manage them.

### 1. Prepare the network
All playgrounds projects share the same [docker network](https://docs.docker.com/network/)
to allow tools managed by separate docker-compose projects to interact with each datastore
without having to reference resources created and managed by external docker-compose projects.

Ensure the `replicante_playgrounds` docker network exists:
```bash
# Check for the network.
$ docker network ls --filter 'name=replicante_playgrounds'
NETWORK ID          NAME                DRIVER              SCOPE

# Create the network since it is missing.
$ docker network create --driver 'bridge' --subnet '172.64.0.0/16' replicante_playgrounds
<NETWORK ID>

# Check again.
$ docker network ls --filter 'name=replicante_playgrounds'
NETWORK ID          NAME                     DRIVER              SCOPE
<NETWORK ID>        replicante_playgrounds   bridge              local
```

The IP range used for this network is `172.64.0.0/16` and is described here:
http://jodies.de/ipcalc?host=172.64.0.0&mask1=16&mask2=

### 2. Start a datastore of choice
Pick one or more supported datastore from the ones in `stores/` and check their READMEs.

Generally, all that is needed is the following commands.
The README of each datastore will provide details if the initialisation steps vary.

When starting the project up from scratch an initialisation scrip is used to prepare the
datastore cluster for operation.
If this is needed, the first start may take a few minutes to prepare the full system.

For the most common case run the following:
```bash
cd stores/<STORE>
# Run just the datastore
docker-compose up

# Or the datastore and the agents
#docker-compose -f docker-compose.yml -f docker-compose-agents.yml up
```

### 3. Start Replicante Core
To start up an instance of replicante core:
```bash
cd tools/replicore
docker-compose up
```

Once initial setup is complete, the replicante core instance will start looking for
agents across all projects.
As you start/stop agents, replicante core will pick up the changes.

For a more advanced development environment checkout the docker-compose project
in the [replicante core repository](https://github.com/replicante-io/replicante).


## Static addresses allocation
Replicante Core needs to know the location of agents and needs to be able to reach them
over the network to function.

To achieve this:

  * Replicante Core communicates with playground agents on a shared docker network
    (`replicante_playgrounds`).
  * Agents are assigned fixed IPs for agent discovery.

The following ranges are allocated to projects to avoid conflicts:

  * Kafka: from `172.64.255.254` to `172.64.255.245`
  * MongoDB (Replica Set): from `172.64.255.244` to `172.64.255.235`
  * MongoDB (Sharded): from `172.64.255.234` to `172.64.255.215`
  * Zookeeper: from `172.64.255.214` to `172.64.255.205`
  * Redis (sentinel): from `172.64.255.204` to `172.64.255.185`
  * Replicante Core: from `172.64.255.184` to `172.64.255.175`


## Development tools
This repository also includes some tools useful for development, testing, and more:

  * Replicore: a all-in-one replicante core setup.
  * [Zipkin](https://zipkin.io/): a distributed tracer.

### Docker networks

  * `replicante_playgrounds`: shared between replicore and agents.
  * 172.32.0.32/27: Zipkin

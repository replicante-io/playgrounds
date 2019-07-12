from collections import defaultdict

import docker
from flask import Flask
import requests

LABEL_AGENT_PORT = 'io.replicante.playground.agent.port'
LABEL_CLUSTER_ID = 'io.replicante.playground.cluster.id'
LABEL_COMPOSE_PROJECT = 'com.docker.compose.project'
NETWORK_PLAYGROUNDS = 'replicante_playgrounds'
REQUEST_TIMEOUT = 1

app = Flask('docker-discover')
container_filters = {
    'label': [LABEL_AGENT_PORT, LABEL_COMPOSE_PROJECT],
    'network': NETWORK_PLAYGROUNDS,
}

def agent_address(container):
    networks = container.attrs['NetworkSettings']['Networks']
    address = networks[NETWORK_PLAYGROUNDS]['IPAddress']
    if not address:
        raise Exception('Missing address for container {}'.format(container.id))
    port = container.labels[LABEL_AGENT_PORT]
    return 'http://{address}:{port}/'.format(address=address, port=port)

def discover_cluster(containers):
    cluster_id = discover_id(containers)
    nodes = list(map(agent_address, containers))
    return {
        'cluster_id': cluster_id,
        'nodes': nodes
    }

def discover_id(containers):
    # Look for static cluster ID on container labels.
    cluster_ids = set([
        container.labels[LABEL_CLUSTER_ID]
        for container in containers
        if container.labels.get(LABEL_CLUSTER_ID)
    ])
    if len(cluster_ids) > 1:
        ids = map(lambda c: c.id, containers)
        ids = ', '.join(ids)
        raise Exception(
            'Containers reported different cluster IDs: {}'.format(ids)
        )
    cluster_id = None
    if len(cluster_ids) == 1:
        return list(cluster_ids)[0]

    # Get the ID from the agent API.
    node = agent_address(containers[0])
    url = '{node}api/unstable/info/datastore'.format(node=node)
    response = requests.get(url, timeout=REQUEST_TIMEOUT)
    response.raise_for_status()
    response = response.json()
    return response['cluster_id']

def group_by_label(label, containers):
    groups = defaultdict(list)
    for container in containers:
        groups[container.labels[label]].append(container)
    return dict(groups.items())

@app.route('/')
def index():
    return {}

@app.route('/discover', methods=['GET', 'POST'])
def discover():
    client = docker.from_env()
    containers = client.containers.list(all=True, filters=container_filters)
    clusters = []
    groups = group_by_label(LABEL_COMPOSE_PROJECT, containers)
    for key in groups.keys():
        cluster = discover_cluster(groups[key])
        clusters.append(cluster)
    return {
        'cursor': None,
        'clusters': clusters,
    }

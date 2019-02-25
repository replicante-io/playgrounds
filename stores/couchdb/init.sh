#!/bin/bash
_mime="Content-Type: application/json"
_user="${COUCHDB_USER}"
_pass="${COUCHDB_PASSWORD}"
_url="http://${_user}:${_pass}@node1:5984/_cluster_setup"


echo "===> Waiting for nodes to be up ..."
sleep 30


echo "===> Checking cluster ..."
if [ "$(curl ${_url})" != '{"state":"cluster_enabled"}' ]; then
  echo "===> Cluster initialised"
  exit 0
fi


echo "===> Initialising cluster ..."
# Define helpers.
function add_node() {
  _host=$1
  _json=$(cat <<- EOJSON
		{"action": "add_node", "host": "${_host}", "port": 5984, "username": "${_user}", "password":"${_pass}"}
EOJSON
	)
	curl -s -X POST -H "${_mime}" "${_url}" -d "${_json}"
}
function enable_cluster() {
  _host=$1
  _json=$(cat <<- EOJSON
		 {"action": "enable_cluster", "bind_address": "0.0.0.0", "username": "${_user}", "password": "${_pass}", "port": 5984, "remote_node": "${_host}", "remote_current_user": "${_user}", "remote_current_password": "${_pass}"}
EOJSON
	)
	curl -s -X POST -H "${_mime}" "${_url}" -d "${_json}"
}
function finish_cluster() {
  curl -s -X POST -H "${_mime}" "${_url}" -d '{"action": "finish_cluster"}'
}
function process_node() {
  _host=$1
  echo "---> Configuring ${_host}"
  enable_cluster "${_host}"
  add_node "${_host}"
}

# Add nodes to cluster.
process_node "node1.playgrounds_couchdb"
process_node "node2.playgrounds_couchdb"
process_node "node3.playgrounds_couchdb"

echo "---> Finishing"
finish_cluster

echo "===> Done"

# MongoDB Playgrounds
Easily create, extend and delete containerised development MongoDB replica sets and Sharded cluster.
The nodes will be exposed to the host with a randomly assigned port.

> Remember: Pods (nodes) can only access each others through the podman host,
> accessible within pods with the `podman-host` DNS name.


## Ensure TLS certificates are available
If the certificates are missing they will be generated:
```bash
$ replidev gen-certs
--> Generating CA certificates
--> Generating Server certificates
--> Generating Client certificates
--> Bundling some certs
CA Certificate:     ./data/pki/replidev/certs/replidev.crt
CA Private Key:     ./data/pki/replidev/keys/replidev.key
Client Bundle:      ./data/pki/replidev/bundles/client.pem
Client Certificate: ./data/pki/replidev/certs/client.crt
Client Private Key: ./data/pki/replidev/keys/client.key
Server Bundle:      ./data/pki/replidev/bundles/server.pem
Server Certificate: ./data/pki/replidev/certs/server.crt
Server Private Key: ./data/pki/replidev/keys/server.key
```

Otherwise nothing happens:
```bash
$ replidev gen-certs
Certificates already available at ./data/pki
To regenerate the certificates invoke the command with --regen
```

Ensure the private keys are accessible from non-root processes in pods:
```bash
$ chmod 0755 ./data/pki/replidev/keys/
```


## Replica Sets
To create a Replica Set we create a node to bootstrap the RS.
After the single-node RS elects a primary we can add more nodes.

```bash
# Start the first node:
$ replidev play node-start mongo/rs
--> Starting mongo/rs node play-node-Q3cr1f49 for cluster mongo-rs
--> Create pod play-node-Q3cr1f49
3ae5e96d833065d4b39267b49ed622489ef2b26d919d6846693b633bd549c2b6
--> Start container play-node-Q3cr1f49-mongo
d315684a735c3c5e5e2833c72d83f562e983c8477cfe4c6eb2345a58abfdbf23
--> Start container play-node-Q3cr1f49-repliagent
36221f1778f3274f438316a8d9188b2869c4e49f34c8da5da9b95be2236cfdea

$ replidev play node-list
NODE                 CLUSTER    STORE PORT   CLIENT PORT   AGENT PORT   STATUS    POD ID  
play-node-Q3cr1f49   mongo-rs   10000        10000         10001        Running   3ae5e96d8330

# Initialise the Replica Set.
# To do this access the mongo shell from withing the mongo container for the node.
# The Replica Set name MUST match the playground `--cluster-id`.
$ podman exec -it play-node-Q3cr1f49-mongo mongo
MongoDB shell version v4.2.5
connecting to: mongodb://127.0.0.1:27017/?compressors=disabled&gssapiServiceName=mongodb
Implicit session: session { "id" : UUID("b89e81a0-59ea-4d3e-a39a-ff8b7a2ebde6") }
MongoDB server version: 4.2.5
Welcome to the MongoDB shell.
> rs.initiate({_id: "mongo-rs", members: [{_id: 0, host: "podman-host:10000"}]})
{
        "ok" : 1,
        "$clusterTime" : {
                "clusterTime" : Timestamp(1586011733, 1),
                "signature" : {
                        "hash" : BinData(0,"AAAAAAAAAAAAAAAAAAAAAAAAAAA="),
                        "keyId" : NumberLong(0)
                }
        },
        "operationTime" : Timestamp(1586011733, 1)
}
mongo-rs:SECONDARY> 
mongo-rs:PRIMARY> exit
bye

# Once the RS is initialised you can add new nodes:
$ replidev play node-start mongo/rs
--> Starting mongo/rs node play-node-zVA09h6a for cluster mongo-rs
--> Create pod play-node-zVA09h6a
5c3259b1e390cf05b3c9f7a0526110bfe25c67c4cc23f0732ececbaaa7c7a91f
--> Start container play-node-zVA09h6a-mongo
1d73c5d8d608f282aa5dac552ea9000bf9e620bb38679ca589cafcd5c9af7e5e
--> Start container play-node-zVA09h6a-repliagent
1760a256bea65d385df66594600e2e498c179a06bf723b60d77e119e7b5846b4

$ replidev play node-list
NODE                 CLUSTER    STORE PORT   CLIENT PORT   AGENT PORT   STATUS    POD ID  
play-node-zVA09h6a   mongo-rs   10002        10002         10003        Running   5c3259b1e390  
play-node-Q3cr1f49   mongo-rs   10000        10000         10001        Running   3ae5e96d8330

# Add the new node to the RS.
# Repeat this process for as many nodes as you want in the RS.
$ podman exec -it play-node-Q3cr1f49-mongo mongo --eval 'rs.add("podman-host:10002");'
MongoDB shell version v4.2.5
connecting to: mongodb://127.0.0.1:27017/?compressors=disabled&gssapiServiceName=mongodb
Implicit session: session { "id" : UUID("4c12ccb4-93b7-4f0f-ad20-688e2a9cd48f") }
MongoDB server version: 4.2.5
{
        "ok" : 1,
        "$clusterTime" : {
                "clusterTime" : Timestamp(1586012327, 1),
                "signature" : {
                        "hash" : BinData(0,"AAAAAAAAAAAAAAAAAAAAAAAAAAA="),
                        "keyId" : NumberLong(0)
                }
        },
        "operationTime" : Timestamp(1586012327, 1)
}

# Optional, check that the agent is responding to API requests.
$ curl --cacert data/pki/replidev/certs/replidev.crt --cert data/pki/replidev/bundles/client.pem https://localhost:10001/api/unstable/info/agent
{"version":{"checkout":"1d701b0ac6296a96d438e96010f5c531386edc53","number":"0.4.1","taint":"not tainted"}}
```


# TODO: remove below
Sharded cluster (3.2)
---------------------
From the repo root:

```bash
cd store/mongo/sharded
docker-compose up
# The first time wait about 40 seconds for the controller
# container to initialise the replica set.
```

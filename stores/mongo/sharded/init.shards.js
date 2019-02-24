var configDB = db.getSiblingDB('config');

// *** shard1 ***
if (configDB.shards.find({_id: "shard1"}).count() === 0) {
    print("Shard1 not present, correcting ...");
    sh.addShard("shard1/shard1n1:27018,shard1n2:27018,shard1n3:27018");
    print("Shard1 ready!");
} else {
    print("Shard1 present, nothing to do");
}

// *** shard2 ***
if (configDB.shards.find({_id: "shard2"}).count() === 0) {
    print("Shard2 not present, correcting ...");
    sh.addShard("shard2/shard2n1:27018,shard2n2:27018,shard2n3:27018");
    print("Shard2 ready!");
} else {
    print("Shard2 present, nothing to do");
}

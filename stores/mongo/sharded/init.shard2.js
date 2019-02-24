var status = rs.status();
if (status.code == 94 /* NotYetInitialized */) {
    print("Replica Set not initialised, correcting ...");
    rs.initiate({
        _id: "shard2",
        members: [
            {_id: 0, host: "shard2n1:27018"},
            {_id: 1, host: "shard2n2:27018"},
            {_id: 2, host: "shard2n3:27018"}
        ]
    });
    print("Replica Set Ready!");
} else {
    print("Replica Set initialised, nothing to do");
}

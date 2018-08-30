var status = rs.status();
if (status.code == 94 /* NotYetInitialized */) {
    print("Replica Set not initialised, correcting ...");
    rs.initiate({
        _id: "playground-mongodb-rs",
        members: [
            {_id: 0, host: "node1:27017"},
            {_id: 1, host: "node2:27017"},
            {_id: 2, host: "node3:27017"}
        ]
    });
    print("Replica Set Ready!");
} else {
    print("Replica Set initialised, nothing to do");
}

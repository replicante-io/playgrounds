var status = rs.status();
if (status.code == 94 /* NotYetInitialized */) {
    print("Replica Set not initialised, correcting ...");
    rs.initiate({
        _id: "persistence",
        members: [{_id: 0, host: "mongo:27017"}]
    });
    print("Replica Set Ready!");
} else {
    print("Replica Set initialised, nothing to do");
}

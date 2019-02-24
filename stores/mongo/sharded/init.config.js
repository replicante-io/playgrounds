var status = rs.status();
if (status.code == 94 /* NotYetInitialized */) {
    print("Replica Set not initialised, correcting ...");
    rs.initiate({
        _id: "config",
        configsvr: true,
        members: [
            {_id: 0, host: "config1:27019"},
            {_id: 1, host: "config2:27019"},
            {_id: 2, host: "config3:27019"}
        ]
    });
    print("Replica Set Ready!");
} else {
    print("Replica Set initialised, nothing to do");
}

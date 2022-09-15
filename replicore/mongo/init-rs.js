var status = rs.status();

if (status.code == 94 /* NotYetInitialized */) {
  print("---> Replica Set not initialised, correcting ...");
  rs.initiate({
    _id: "replistore",
    members: [{_id: 0, host: "127.0.0.1:27017"}]
  });

  print("---> Replica set configured, waiting for primary.");
  while(true) {
    sleep(1000);
    print("---> Checking Replica Set status ...");
    status = rs.status();
    if (status.myState === 1) {
      break;
    }
  }

  // Once the primary is elected give it time to initialise itself.
  sleep(1000);
  print("---> Replica Set Ready!");
} else {

  print("---> Replica Set initialised, nothing to do");
}

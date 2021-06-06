ExUnit.start()
Mox.Server.start_link([])
Mox.defmock(PollingToSocket.MockHTTPoison, for: PollingToSocket.HTTPBase)

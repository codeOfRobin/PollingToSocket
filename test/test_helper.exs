ExUnit.start()
Mox.Server.start_link([])
Mox.defmock(PollingToSocket.MockHTTPoison, for: PollingToSocket.HTTPBase)
Mox.defmock(PollingToSocket.MockWeatherAPI, for: PollingToSocket.WeatherAPI)

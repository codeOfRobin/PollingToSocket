ExUnit.start()
Mox.Server.start_link([])
Mox.defmock(PollingToSocket.MockHTTPoison, for: PollingToSocket.HTTPBase)

Mox.defmock(PollingToSocket.MockWeatherAPI, for: PollingToSocket.WeatherAPI)
Application.put_env(:polling_to_socket, :weather_api, PollingToSocket.MockWeatherAPI)
Application.put_env(:polling_to_socket, :http_client, PollingToSocket.MockHTTPoison)

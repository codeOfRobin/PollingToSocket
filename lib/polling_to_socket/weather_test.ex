defmodule PollingToSocket.WeatherAPI do
  @callback temp() :: {String.t()}
  @callback humidity() :: {String.t()}
end

defmodule PollingToSocket.HumanizedWeather do
  @behaviour PollingToSocket.WeatherAPI

  @impl PollingToSocket.WeatherAPI
  def temp() do
    {:ok, temp} = Application.get_env(:polling_to_socket, :weather_api, nil).temp()
    "Current temperature is #{temp} degrees"
  end

  @impl PollingToSocket.WeatherAPI
  def humidity() do
    {:ok, humidity} = Application.get_env(:polling_to_socket, :weather_api, nil).humidity()
    "Current humidity is #{humidity}%"
  end
end

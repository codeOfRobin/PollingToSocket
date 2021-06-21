defmodule PollingToSocket.HumanizedWeatherTest do
  use ExUnit.Case, async: true

  import Mox

  setup %{} do
    Application.put_env(:polling_to_socket, :weather_api, PollingToSocket.MockWeatherAPI)
  end

  # Make sure mocks are verified when the test exits
  setup :verify_on_exit!

  test "gets and formats temperature and humidity" do
    PollingToSocket.MockWeatherAPI
    |> expect(:temp, fn -> {:ok, 30} end)
    |> expect(:humidity, fn -> {:ok, 60} end)

    assert PollingToSocket.HumanizedWeather.temp() ==
             "Current temperature is 30 degrees"

    assert PollingToSocket.HumanizedWeather.humidity() ==
             "Current humidity is 60%"
  end
end

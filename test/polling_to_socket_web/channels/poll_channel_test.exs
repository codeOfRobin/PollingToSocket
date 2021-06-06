defmodule PollingToSocketWeb.PollChannelTest do
  use PollingToSocketWeb.ChannelCase, async: true

  describe "testing joining channel" do
    test "joining" do
      payload = %{
        "request" => %{
          "url" => "https://httpbin.org"
        },
        "interval" => 1000
      }

      {:ok, _, _socket} = join_channel("poll:12345", payload)
    end
  end

  defp join_channel(topic, payload) do
    PollingToSocketWeb.UserSocket
    |> socket()
    |> subscribe_and_join(PollingToSocketWeb.PollChannel, topic, payload)
  end
end

defmodule PollingToSocketWeb.PollChannelTest do
  use PollingToSocketWeb.ChannelCase, async: true
  import Mox

  describe "testing joining channel" do
    test "joining" do
      payload = %{
        request: %{
          url: "https://example.org",
          method: "get"
        },
        interval: 100
      }

      caller = self()

      PollingToSocket.MockHTTPoison
      |> expect(:get, fn _url ->
        send(caller, "done")

        {:ok,
         %{
           status_code: 200
         }}
      end)

      {:ok, _, _socket} = join_channel("poll:12345", payload)

      assert_receive("done", 150)
    end
  end

  defp join_channel(topic, payload) do
    PollingToSocketWeb.UserSocket
    |> socket()
    |> subscribe_and_join(PollingToSocketWeb.PollChannel, topic, payload)
  end
end

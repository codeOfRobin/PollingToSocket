defmodule PollingToSocketWeb.PollChannelTest do
  use PollingToSocketWeb.ChannelCase, async: true
  import Mox

  setup do
    bypass = Bypass.open()
    {:ok, bypass: bypass}
  end

  test "joining channel", %{bypass: bypass} do
    payload = %{
      request: %{
        url: "#{endpoint_url(bypass.port)}/status.json",
        method: "get"
      },
      interval: 10
    }

    random_number = :rand.uniform(50)
    caller = self()

    Bypass.expect(bypass, "GET", "/status.json", fn conn ->
      send(caller, "done")
      Plug.Conn.resp(conn, 200, ~s<{"data": "all good"}>)
    end)

    {:ok, _, _socket} = join_channel("poll:12345", payload)

    Enum.each(1..random_number, fn x ->
      assert_receive("done", 100 * x)
    end)
  end

  defp endpoint_url(port), do: "http://localhost:#{port}/"

  defp join_channel(topic, payload) do
    PollingToSocketWeb.UserSocket
    |> socket()
    |> subscribe_and_join(PollingToSocketWeb.PollChannel, topic, payload)
  end
end

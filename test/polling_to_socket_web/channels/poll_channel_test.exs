defmodule PollingToSocketWeb.PollChannelTest do
  use PollingToSocketWeb.ChannelCase, async: true

  setup do
    bypass = Bypass.open()
    {:ok, bypass: bypass}
  end

  test "joining channel triggers requests", %{bypass: bypass} do
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

      conn
      |> Plug.Conn.put_resp_header("Via", "1.1 vegur")
      |> Plug.Conn.put_resp_content_type("application/json")
      |> Plug.Conn.resp(200, ~s<{"data": "all good"}>)
    end)

    {:ok, _, _socket} = join_channel("poll:12345", payload)

    Enum.each(1..random_number, fn x ->
      assert_receive("done", 100 * x)

      assert_broadcast("received_data", %{
        body: ~s<{"data": "all good"}>,
        headers: %{
          "Via" => "1.1 vegur",
          "content-type" => "application/json; charset=utf-8"
        }
      })
    end)
  end

  defp endpoint_url(port), do: "http://localhost:#{port}/"

  defp join_channel(topic, payload) do
    PollingToSocketWeb.UserSocket
    |> socket()
    |> subscribe_and_join(PollingToSocketWeb.PollChannel, topic, payload)
  end
end

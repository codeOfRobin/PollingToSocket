defmodule BypassBorkinessTest do
  use ExUnit.Case, async: true

  setup do
    bypass = Bypass.open()
    {:ok, bypass: bypass}
  end

  test "client can handle an error response", %{bypass: bypass} do
    Bypass.expect_once(bypass, "GET", "/status.json", fn conn ->
      Plug.Conn.resp(conn, 200, ~s<{"data": "all good"}>)
    end)

    {:ok, response} = HTTPoison.get("#{endpoint_url(bypass.port)}/status.json")
    {:ok, result} = Jason.decode(response.body)
    assert result["data"] == "all good"
  end

  defp endpoint_url(port), do: "http://localhost:#{port}/"
end

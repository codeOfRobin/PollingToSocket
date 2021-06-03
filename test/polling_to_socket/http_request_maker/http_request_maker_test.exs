defmodule PollingToSocket.HTTPRequestMakerTest do
  import Mox
  import HTTPoison
  use ExUnit.Case, async: true
  setup :verify_on_exit!

  test "Simple GET request" do
    PollingToSocket.MockHTTPClient
    |> expect(:get, fn _ ->
      {:ok,
       %HTTPoison.Response{
         status_code: 200
       }}
    end)

    payload_input = %{
      "method" => "get",
      "url" => "asdfnjkwaejfwaekf.org"
    }

    {:ok, response} = PollingToSocket.HTTPRequestMaker.make_request(from: payload_input)
    assert response.status_code == 200
  end
end

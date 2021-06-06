defmodule PollingToSocket.HTTPRequestMakerTest do
  import Mox
  use ExUnit.Case
  setup :set_mox_global
  setup :verify_on_exit!

  test "Simple GET request" do
    PollingToSocket.MockHTTPoison
    |> expect(:get, fn _url ->
      {:ok,
       %{
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

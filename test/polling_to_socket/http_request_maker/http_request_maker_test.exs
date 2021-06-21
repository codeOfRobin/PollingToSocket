defmodule PollingToSocket.HTTPRequestMakerTest do
  import Mox
  use ExUnit.Case

  setup do
    Application.put_env(:polling_to_socket, :http_client, PollingToSocket.MockHTTPoison)
  end

  test "Simple GET request" do
    PollingToSocket.MockHTTPoison
    |> expect(:get, fn _url ->
      {:ok,
       %{
         status_code: 200
       }}
    end)

    payload_input = %{
      :method => "get",
      :url => "example.com"
    }

    {:ok, response} =
      PollingToSocket.HTTPRequestMaker.make_request_closure(from: payload_input).()

    assert response.status_code == 200
  end
end

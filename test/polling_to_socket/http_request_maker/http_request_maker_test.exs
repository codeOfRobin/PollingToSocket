defmodule PollingToSocket.HTTPRequestMakerTest do

  import Mox
  use ExUnit.Case, async: true

  test "Simple GET request" do
    Mox.expect(HTTPMock, :post, fn %Request{body: body} ->
      {:ok, Response.new(200, [], "body")}
    end)

    
  end
end

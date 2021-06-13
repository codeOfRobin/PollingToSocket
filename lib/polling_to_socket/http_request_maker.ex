defmodule PollingToSocket.HTTPRequestMaker do
  def make_request_closure(from: input) do
    %{url: url, method: method} = input

    case method do
      "get" -> fn -> PollingToSocket.HTTPClient.get(url: url) end
    end
  end
end

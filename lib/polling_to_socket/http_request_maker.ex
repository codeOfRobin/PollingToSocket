defmodule PollingToSocket.HTTPRequestMaker do
  def make_request(from: input) do
    %{"url" => url, "method" => method} = input

    case method do
      "get" -> PollingToSocket.HTTPClient.get(url: url)
    end
  end
end

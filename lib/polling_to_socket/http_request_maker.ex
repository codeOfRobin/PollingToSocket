defmodule PollingToSocket.HTTPRequestMaker do
  import HTTPoison

  def make_request(from: input) do
    %{"url" => url, "method" => method} = input

    case method do
      "get" -> http_client().get(url)
    end
  end

  defp http_client do
    Application.get_env(:polling_to_socket, :http_client, HTTPoison)
  end
end

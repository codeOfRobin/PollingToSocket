defmodule PollingToSocket.HTTPRequestMaker do
  def make_request(from: input) do
    %{"url" => url, "method" => method} = input

    case method do
      "get" -> http_client().get(url)
    end
  end

  defp http_client do
    Application.get_env(:polling_to_socket, :httpoison)
  end
end

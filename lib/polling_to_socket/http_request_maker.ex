defmodule PollingToSocket.HTTPRequestMaker do

  import HTTPoison

  def make_request(from: input) do

  end

  defp http_client do
    Application.get_env(:polling_to_socket, :http_client, HTTPoision)
  end
end

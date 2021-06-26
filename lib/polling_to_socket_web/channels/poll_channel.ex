defmodule PollingToSocketWeb.PollChannel do
  use PollingToSocketWeb, :channel
  alias PollingToSocket.HTTPRequestMaker

  def join("poll:" <> _request_instance, payload, socket) do
    channel = self()

    %{"interval" => interval, "request" => request} = payload

    request_input = %{
      :method => request["method"],
      :url => request["url"]
    }

    request_closure = HTTPRequestMaker.make_request_closure(from: request_input)

    {:ok, _pid} =
      GenServer.start_link(PollingToSocket.Periodically, %{
        interval: interval,
        work: fn ->
          send(
            channel,
            {:make_request, %{work: request_closure}}
          )
        end
      })

    {:ok, socket}
  end

  def handle_in("request_data", _payload, socket) do
    {:noreply, socket}
  end

  def handle_info({:make_request, %{work: closure}}, socket) do
    {:ok, response} = closure.()

    broadcast(socket, "received_data", %{
      body: response.body,
      headers:
        Enum.reduce(response.headers, %{}, fn {key, value}, dict ->
          Map.put(dict, key, value)
        end)
    })

    {:noreply, socket}
  end
end

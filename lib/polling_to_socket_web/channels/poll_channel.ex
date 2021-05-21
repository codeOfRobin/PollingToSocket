defmodule PollingToSocketWeb.PollChannel do
  use PollingToSocketWeb, :channel

  def join("poll:" <> _poll_id, _msg, socket) do
    {:ok, socket}
  end

  def handle_in("request_data", payload, socket) do
    IO.inspect(payload)
    {:noreply, socket}
  end
end

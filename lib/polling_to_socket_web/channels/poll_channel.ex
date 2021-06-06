defmodule PollingToSocketWeb.PollChannel do
  use PollingToSocketWeb, :channel

  def join("poll:" <> _request_instance, _msg, socket) do
    {:ok, socket}
  end

  def handle_in("request_data", _payload, socket) do
    {:noreply, socket}
  end
end

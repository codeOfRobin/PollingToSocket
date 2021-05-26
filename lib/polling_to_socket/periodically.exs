defmodule PollingToSocket.Periodically do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{})
  end

  @impl true
  def init(state) do
    # Schedule work to be performed on start
    schedule_work(state.interval)

    {:ok, state}
  end

  @impl true
  def handle_info(:work, state) do
    # Do the desired work here
    # ...

    # Reschedule once more
    schedule_work(state)

    {:noreply, state}
  end

  defp schedule_work(interval) do
    # We schedule the work to happen in 2 hours (written in milliseconds).
    # Alternatively, one might write :timer.hours(2)
    Process.send_after(self(), :work, interval)
  end
end

defmodule PollingToSocket.PeriodicTest do
  use ExUnit.Case, async: true

  test "Basic Behaviour" do
    caller = self
    args = %{interval: 100, work: fn ->
      spawn_link(fn ->
        send(caller, "done")
      end)
    end, id: self()}
    GenServer.start_link(PollingToSocket.Periodically, args)

    assert_receive("done", 150)

    assert_receive("done", 150)
    assert_receive("done", 150)
    assert_receive("done", 150)
    assert_receive("done", 150)


  end
end

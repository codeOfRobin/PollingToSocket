defmodule PollingToSocket.PeriodicTest do
  use ExUnit.Case, async: true

  test "Basic Behaviour" do
<<<<<<< HEAD
    caller = self()
    random_number = :rand.uniform(50)

    # Run a random number of cycles and wait
    args = %{interval: 10, work: fn ->
        send(caller, "done")
    end, id: self()}
    GenServer.start_link(PollingToSocket.Periodically, args)

    # Wait > 10ms for the response
    Enum.each(1..random_number, fn(x) ->
      assert_receive("done", 11 * x)
    end)
=======
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

>>>>>>> cf3d0b1 (Adding periodic tests)

  end
end

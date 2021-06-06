defmodule PollingToSocket.PeriodicTest do
  use ExUnit.Case, async: true

  test "Basic Behaviour" do
    caller = self()
    random_number = :rand.uniform(50)

    # Run a random number of cycles and wait
    args = %{
      interval: 10,
      work: fn ->
        send(caller, "done")
      end,
      id: self()
    }

    GenServer.start_link(PollingToSocket.Periodically, args)

    # Wait > 10ms for the response
    Enum.each(1..random_number, fn x ->
      assert_receive("done", 12 * x)
    end)
  end
end

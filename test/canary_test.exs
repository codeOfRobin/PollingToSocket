defmodule PollingToSocket.CanaryTest do
  use ExUnit.Case, async: true

  describe "canary test" do
    test "make sure nothing is absolutely borked" do
      assert 1 + 1 == 2
    end
  end
end

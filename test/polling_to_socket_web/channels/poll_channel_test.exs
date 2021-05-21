defmodule PollingToSocketWeb.PollChannelTest do
  use PollingToSocketWeb.ChannelCase, async: true
  describe "test" do
    test "make sure nothing is absolutely borked" do
      assert 1 + 1 == 2
    end
  end
end

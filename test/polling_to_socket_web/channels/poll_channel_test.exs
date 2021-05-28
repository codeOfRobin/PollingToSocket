defmodule PollingToSocketWeb.PollChannelTest do
  use PollingToSocketWeb.ChannelCase, async: true

  describe "testing joining channel" do
    test "joining" do
      {:ok, _, socket} = join_channel("poll:12345")
    end
  end


  defp join_channel(topic) do
    PollingToSocketWeb.UserSocket
    |> socket()
    |> subscribe_and_join(PollingToSocketWeb.PollChannel, topic)
  end
end

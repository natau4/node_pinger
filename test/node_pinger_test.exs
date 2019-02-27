defmodule NodePingerTest do
  use ExUnit.Case

  import ExUnit.CaptureLog

  test "check pinger logs for present nodes" do
    assert capture_log(fn -> NodePinger.Application.restart_children(NodePinger) end) =~
             "[warn]  Unsuccessful ping for node name@host"
  end

  test "check pinger logs for nonexistent nodes" do
    Application.put_env(:node_pinger, :nodes, [])

    assert capture_log(fn -> NodePinger.Application.restart_children(NodePinger) end) =~ ""
  end

  test "check pinger logs for null nodes" do
    Application.delete_env(:node_pinger, :nodes)

    assert capture_log(fn -> NodePinger.Application.restart_children(NodePinger) end) =~ ""
  end
end

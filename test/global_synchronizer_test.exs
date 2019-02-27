defmodule GlobalSynchronizerTest do
  use ExUnit.Case

  import ExUnit.CaptureLog

  test "global sync completed successfully" do
    logs = capture_log(fn -> NodePinger.Application.restart_children(GlobalSynchronizer) end)

    assert logs =~ "[info]  Synchronization for global names"
    assert !(logs =~ "Synchronization for global names completed with error")
  end
end

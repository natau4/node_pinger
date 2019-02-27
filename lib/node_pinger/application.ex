defmodule NodePinger.Application do
  use Application

  require Logger

  import Supervisor.Spec

  @supervisor_name NodePinger.Supervisor

  def start(_type, _args) do
    Logger.info("Node pinger is starting")

    children = [
      worker(NodePinger, []),
      worker(GlobalSynchronizer, [])
    ]

    opts = [strategy: :one_for_one, name: @supervisor_name]
    Supervisor.start_link(children, opts)
  end

  def restart_children(child) do
    Supervisor.terminate_child(@supervisor_name, child)
    Supervisor.restart_child(@supervisor_name, child)
  end
end

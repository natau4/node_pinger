defmodule NodePinger do
  require Logger
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_opts) do
    ping()
    schedule()
    {:ok, []}
  end

  def handle_info(:ping, smth) do
    Logger.info("Check nodes")

    ping()
    schedule()

    {:noreply, smth}
  end

  defp ping() do
    Application.get_env(:node_pinger, :nodes, [])
    |> Enum.map(fn node -> {node, Node.ping(node)} end)
    |> Enum.filter(fn {_, result} -> result == :pang end)
    |> Enum.each(fn {node, _} -> Logger.warn("Unsuccessful ping for node #{node}") end)
  end

  defp schedule() do
    Process.send_after(self(), :ping, Application.get_env(:node_pinger, :node_ping_interval))
  end
end

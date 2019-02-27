defmodule GlobalSynchronizer do
  require Logger
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_opts) do
    sync()
    schedule()
    {:ok, []}
  end

  def handle_info(:sync, smth) do
    sync()
    schedule()

    {:noreply, smth}
  end

  defp sync() do
    Logger.info("Synchronization for global names")

    case :global.sync() do
      :ok ->
        :ok

      {:error, reason} ->
        Logger.error("Synchronization for global names completed with error: #{inspect(reason)}")
        {:error, reason}
    end
  end

  defp schedule() do
    Process.send_after(self(), :sync, Application.get_env(:node_pinger, :global_sync_interval))
  end
end

use Mix.Config

config :node_pinger,
  # 1 second
  node_ping_interval: 1000,
  # 5 minutes
  global_sync_interval: 300_000,
  nodes: [:name@host]

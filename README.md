# NodePinger

A very simple Elixir application that can:

- ping nodes at regular interval;
- synchronize global node names known to the current node.

## Usage

The list of nodes should be specified in the config:

```elixir
config: node_pinger, nodes: [:name@host]
```

Intervals can be redefined in the config (by default, ping is performed every second, synchronize global names is every 5 minutes):

```elixir
config: node_pinger,
   node_ping_interval: 1000,
   global_sync_interval: 300_000
```

[![Sponsored by FunBox](https://funbox.ru/badges/sponsored_by_funbox_centered.svg)](https://funbox.ru)

NodePinger is a very simple application that can
* ping nodes at regular interval;
* synchronize global node names known to the current node.

The list of nodes should be specified in the config.
```
config: node_pinger, nodes: [:name@host]
```

Intervals can be redefined in config (by default, ping is performed every second, synchronize global names is every 5 minutes)
```
config: node_pinger,
   node_ping_interval: 1000,
   global_sync_interval: 300_000
```
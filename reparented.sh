


source ./env.sh


vtctl -topo_implementation=etcd2 -topo_global_server_address=localhost:2379 -topo_global_root=/vitess/global TabletExternallyReparented cell1-0000000100 -disable_active_reparents


vtctl -topo_implementation=etcd2 -topo_global_server_address=localhost:2379 -topo_global_root=/vitess/global DeleteTablet -allow_primary cell1-0000000200

vtctlclient InitShardPrimary -force user_bill/0 cell1-100
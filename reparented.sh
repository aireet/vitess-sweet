


source ./env.sh


vtctl -topo_implementation=etcd2 -topo_global_server_address=localhost:2379 -topo_global_root=/vitess/global TabletExternallyReparented user_bill
# etcd 地址
TOPO_SERVER=localhost:2379

TOPOLOGY_FLAGS="--topo_implementation etcd2 --topo_global_server_address $TOPO_SERVER --topo_global_root /vitess/global"

alias vtctlclient="command vtctlclient --server localhost:15999 --log_dir ${VTDATAROOT}/tmp --alsologtostderr"

alias vtctldclient="command vtctldclient --server localhost:15999"
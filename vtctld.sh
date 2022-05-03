source ./env.sh
# vtctld
echo "Start vtctld"
vtctld -topo_implementation=etcd2 -topo_global_server_address=$TOPO_SERVER -topo_global_root=/vitess/global \
  -log_dir=${VTDATAROOT}/vtctld \
  -port=15000 \
  -grpc_port=15999 \
  -service_map='grpc-vtctl' \
  -pid_file $VTDATAROOT/vtctld/vtctld.pid \
  > $VTDATAROOT/vtctld/vtctld.out 2>&1 &

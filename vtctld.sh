# vtctld
echo "Start vtctld"
vtctld -topo_implementation=etcd2 -topo_global_server_address=$TOPO_SERVER -topo_global_root=/vitess/global \
  -log_dir=${VTDATAROOT}/tmp \
  -port=15000 \
  -grpc_port=15999 \
  -service_map='grpc-vtctl' \
  -pid_file $VTDATAROOT/tmp/vtctld.pid \
  > $VTDATAROOT/tmp/vtctld.out 2>&1 &

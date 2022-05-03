
source ./env.sh


vtgate -topo_implementation=etcd2 -topo_global_server_address=$TOPO_SERVER -topo_global_root=/vitess/global \
  -log_dir=${VTDATAROOT}/tmp/vtgate \
  -cell=cell1 \
  -cells_to_watch=cell1 \
  -port=15001 \
  -mysql_server_port=13306 \
  -tablet_types_to_wait PRIMARY,REPLICA \
  -mysql_auth_server_impl=static \
  -mysql_auth_server_static_file=/app/vitess/vitess-sweet/mysql.json \
  -grpc_port=15991 \
  -service_map='grpc-vtgateservice' \
  -vschema_ddl_authorized_users='%' \
  -pid_file $VTDATAROOT/tmp/vtgate/vtgate.pid \
   > $VTDATAROOT/tmp/vtgate/vtgate.out 2>&1 &

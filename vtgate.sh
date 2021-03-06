
source ./env.sh


vtgate -topo_implementation=etcd2 -topo_global_server_address=$TOPO_SERVER -topo_global_root=/vitess/global \
  -log_dir=${VTDATAROOT}/vtgate \
  -cell=cell1 \
  -cells_to_watch=cell1 \
  -port=15001 \
  -mysql_server_port=13306 \
  -tablet_types_to_wait PRIMARY,REPLICA \
  -mysql_auth_server_impl=static \
  -mysql_auth_server_static_file=/app/vitess/vitess-sweet/mysql.json \
  -grpc_port=15991 \
  -tracer opentracing-jaeger -jaeger-agent-host 127.0.0.1:6831 -tracing-sampling-rate 1.0 \
  -service_map='grpc-vtgateservice' \
  -vschema_ddl_authorized_users='%' \
  -pid_file $VTDATAROOT/vtgate/vtgate.pid \
   > $VTDATAROOT/vtgate/vtgate.out 2>&1 &

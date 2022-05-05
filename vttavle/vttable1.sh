
source ../env.sh

# vttablet
echo "Start Vttablet"
vttablet -topo_implementation=etcd2 -topo_global_server_address=$TOPO_SERVER -topo_global_root=/vitess/global \
  -log_dir=${VTDATAROOT}/fund1 \
  -tablet-path=cell1-1 \
  -vtctld_addr=127.0.0.1:15000 \
  -health_check_interval=5s \
  -db_host=127.0.0.1 \
  -db_port=3306 \
  -db_dba_user=root \
  -db_dba_password=echo2022!~Aa \
  -db_app_user=root \
  -db_app_password=echo2022!~Aa \
  -db_allprivs_user=root \
  -db_allprivs_password=echo2022!~Aa \
  -db_filtered_user=root \
  -db_filtered_password=echo2022!~Aa \
  -init_keyspace=fundation \
  -tracer opentracing-jaeger -jaeger-agent-host 127.0.0.1:6831 -tracing-sampling-rate 1.0 \
  -init_shard=-33 \
  -init_tablet_type=replica \
  -port=15101 \
  -grpc_port=16101 \
  -service_map 'grpc-queryservice,grpc-tabletmanager,grpc-updatestream' \
  -enable_semi_sync=false \
  -enable_replication_reporter=false \
  -queryserver-config-pool-size=16 \
  -queryserver-config-transaction-cap=300 \
  -queryserver-config-stream-pool-size=16 \
 -pid_file $VTDATAROOT/fund1/vttablet.pid \
 > $VTDATAROOT/fund1/vttablet.out 2>&1 &


source ../env.sh

# vttablet
echo "Start Vttablet"
vttablet -topo_implementation=etcd2 -topo_global_server_address=$TOPO_SERVER -topo_global_root=/vitess/global \
  -log_dir=${VTDATAROOT}/tmp1 \
  -tablet-path=cell1-100 \
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
  -init_keyspace=ALL_IN_ONE \
  -init_db_name_override=vt1_ \
  -init_shard=-50 \
  -init_tablet_type=replica \
  -port=15201 \
  -grpc_port=16201 \
  -service_map 'grpc-queryservice,grpc-tabletmanager,grpc-updatestream' \
  -enable_semi_sync=false \
  -enable_replication_reporter=false \
  -queryserver-config-pool-size=16 \
  -queryserver-config-transaction-cap=300 \
  -queryserver-config-stream-pool-size=16 \
 -pid_file $VTDATAROOT/tmp1/vttablet.pid \
 > $VTDATAROOT/tmp1/vttablet.out 2>&1 &

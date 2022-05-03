
source ../env.sh

# vttablet
echo "Start Vttablet"
vttablet -topo_implementation=etcd2 -topo_global_server_address=$TOPO_SERVER -topo_global_root=/vitess/global \
  -log_dir=${VTDATAROOT}/tmp \
  -tablet-path=cell1-100 \
  -db_host=172.18.135.216 \
  -db_port=3306 \
  -db_dba_user=root \
  -db_dba_password=echo2022!~Aa \
  -db_app_user=root \
  -db_app_password=echo2022!~Aa \
  -db_allprivs_user=root \
  -db_allprivs_password=echo2022!~Aa \
  -db_filtered_user=root \
  -db_filtered_password=echo2022!~Aa \
  -init_keyspace=user_bill \
  -init_shard=0 \
  -init_tablet_type=replica \
  -port=15103 \
  -grpc_port=16103 \
  -service_map 'grpc-queryservice,grpc-tabletmanager' \
  -enable_semi_sync=false \
  -enable_replication_reporter=false \
  -queryserver-config-pool-size=16 \
  -queryserver-config-transaction-cap=300 \
  -queryserver-config-stream-pool-size=16 \
 -pid_file $VTDATAROOT/tmp/vttablet.pid \
 > $VTDATAROOT/tmp/vttablet.out 2>&1 &

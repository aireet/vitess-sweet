
source ./env.sh

# vttablet
echo "Start Vttablet"
vttablet -topo_implementation=etcd2 -topo_global_server_address=$TOPO_SERVER -topo_global_root=/vitess/global \
  -log_dir=${VTDATAROOT}/tmp \
  -tablet-path=cell1-100 \
  -db_host=127.0.0.1 \
  -db_port=3306 \
  -db_app_user=root \
  -db_app_password=echo2022!~Aa \
  -init_keyspace=user_bill \
  -init_shard=0 \
  -init_tablet_type=replica \
  -port=15100 \
  -grpc_port=16100 \
  -service_map 'grpc-queryservice,grpc-tabletmanager' \
  -enable_semi_sync=false \
  -enable_replication_reporter=false \
  -restore_from_backup=false \
  -queryserver-config-pool-size=16 \
  -queryserver-config-transaction-cap=300 \
  -queryserver-config-stream-pool-size=16 \
 -pid_file $VTDATAROOT/tmp/vttablet.pid \
 > $VTDATAROOT/tmp/vttablet.out 2>&1 &

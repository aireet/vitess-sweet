# etcd 地址
TOPO_SERVER=localhost:2379


# vtctld
echo "Start vtctld"
vtctld -topo_implementation=etcd2 -topo_global_server_address=$TOPO_SERVER -topo_global_root=/vitess/global \
  -log_dir=${VTDATAROOT}/tmp \
  -port=15000 \
  -grpc_port=15999 \
  -service_map='grpc-vtctl' \
  -pid_file $VTDATAROOT/tmp/vtctld.pid \
  > $VTDATAROOT/tmp/vtctld.out 2>&1 &


# cell
echo "Set cell"
vtctlclient AddCellInfo \
  -root /vitess/cell1 \
  -server_address $TOPO_SERVER \
  cell1

# mysql
echo "Start Mysql"
mysqlctl \
  -log_dir=${VTDATAROOT}/tmp \
  -tablet_uid=100 \
  -mysql_port=33001 \
  init

# vttablet
echo "Start Vttablet"
vttablet -topo_implementation=etcd2 -topo_global_server_address=$TOPO_SERVER -topo_global_root=/vitess/global \
  -log_dir=${VTDATAROOT}/tmp \
  -tablet-path=cell1-100 \
  -tablet_hostname=node02 \
  -init_keyspace=commerce \
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

vtctlclient ListAllTablets
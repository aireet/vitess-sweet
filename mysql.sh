
source ./env.sh

# mysql
echo "Start Mysql"
mysqlctl \
  -log_dir=${VTDATAROOT}/tmp \
  -tablet_uid=100 \
  -mysql_port=33100 \
  init




source ./env.sh

echo "CREATING A CELL"

vtctlclient AddCellInfo \
  -root /vitess/cell1 \
  -server_address $TOPO_SERVER \
  -server "localhost:15999"
  cell1
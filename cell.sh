
source ./env.sh

echo "CREATING A CELL"

vtctl AddCellInfo \
  $TOPOLOGY_FLAGS \
  -root /vitess/cell1 \
  -server_address $TOPO_SERVER \
  cell1
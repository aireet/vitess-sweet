
source ./env.sh

echo "CREATING A CELL"

vtctl AddCellInfo \
  -root /vitess/cell1 \
  -server_address $TOPO_SERVER \
  cell1
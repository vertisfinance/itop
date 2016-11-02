echo "mysql"
echo "--------------------"
docker build -t mysql "../../docker/mysql"

echo "itop"
echo "--------------------"
docker build -t itop "../../docker/itop"

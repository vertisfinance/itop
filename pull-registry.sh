set -e

for docker_image in itop-itop itop-mysql
do
  docker pull vertis-docker-registry:5000/$docker_image:latest
done

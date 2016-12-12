#!/bin/bash

set -e


PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "mysql"
echo "--------------------"
docker build -t vertis-docker-registry:5000/itop-mysql -f "$PROJECT_ROOT/docker/mysql/Dockerfile" .

echo "itop"
echo "--------------------"
docker build -t vertis-docker-registry:5000/itop-itop -f "$PROJECT_ROOT/docker/itop/Dockerfile" .

#!/bin/bash

set -e


PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "mysql"
echo "--------------------"
docker build -t vertis-docker-registry:5000/itop-mysql "$PROJECT_ROOT/docker/mysql"

echo "itop"
echo "--------------------"
docker build -t vertis-docker-registry:5000/itop-itop -f "$PROJECT_ROOT/docker/itop/Dockerfile" .

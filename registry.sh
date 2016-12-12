#!/bin/bash

set -e

timestamp=$(date +"%Y-%m-%d")

echo "pricefetch"
echo "--------------------"
docker tag vertis-docker-registry:5000/itop-mysql vertis-docker-registry:5000/itop-mysql:${timestamp}

echo "sshd"
echo "--------------------"
docker tag vertis-docker-registry:5000/itop-itop vertis-docker-registry:5000/itop-itop:${timestamp}

echo "Push docker-regitry"
echo "--------------------"
docker push vertis-docker-registry:5000/itop-itop:latest
docker push vertis-docker-registry:5000/itop-mysql:latest
docker push vertis-docker-registry:5000/itop-itop:${timestamp}
docker push vertis-docker-registry:5000/itop-mysql:${timestamp}

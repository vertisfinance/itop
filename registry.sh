#!bin/sh
set -e

timestamp=$(date +"%Y-%m-%d-%H-%M")
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
STATUS=`git status 2> /dev/null | grep 'working directory clean' | awk '{print $6}'`
PUSH=`git diff origin/master | grep diff | head -1 | awk '{print $1}'`

if [ [${BRANCH}] = "[master]" ]; then
  if [ [${STATUS}] = "[clean]" ]; then
    if [ [${PUSH}] != "[diff]" ]; then
      for docker_image in itop mysql
      do
        if [ [$docker_image] = "itop" ]; then
          docker build -t $docker_image -f "$PROJECT_ROOT/vertis-docker/itop/Dockerfile" .
        else
          docker build -t $docker_image "$PROJECT_ROOT/vertis-docker/mysql/"
        fi
          docker tag $docker_image vertis-docker-registry:5000/$docker_image:latest
          docker tag $docker_image vertis-docker-registry:5000/$docker_image:${timestamp}
          docker push vertis-docker-registry:5000/$docker_image:latest
          docker push vertis-docker-registry:5000/$docker_image:${timestamp}
          docker rmi vertis-docker-registry:5000/$docker_image:${timestamp}
      done
    else
      echo "PLEASE PUSH ORIGIN/MASTER"
    fi
  else
    echo "PLEASE COMMIT THE CHANGE"
  fi
else
  echo "PLEASE CHANGE BRANCH (MASTER)"
fi

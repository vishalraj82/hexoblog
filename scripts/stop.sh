#! /bin/bash

set -x

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $SCRIPT_DIR/vars.sh

docker-compose stop
docker-compose down

APP_CONTAINER=`grep APP_CONTAINER $DOCKER_ENV_FILE | awk -F'=' '{ print $2 }'`
docker container rm $APP_CONTAINER

PROXY_CONTAINER=`grep PROXY_CONTAINER $DOCKER_ENV_FILE | awk -F'=' '{ print $2 }'`
docker container rm $PROXY_CONTAINER

DOCKER_IMAGE=`grep DOCKER_IMAGE $DOCKER_ENV_FILE | awk -F'=' '{ print $2 }'`
docker rmi $DOCKER_IMAGE

docker container prune -f
docker image prune -f
docker network prune -f
docker volume prune -f

rm -f $PROXY_CONF_FILE

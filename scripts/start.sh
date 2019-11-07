#! /bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $SCRIPT_DIR/vars.sh

if [ -f "$DOCKER_ENV_FILE" ]; then
    HEXO_PORT=`grep HEXO_PORT $DOCKER_ENV_FILE | awk -F'=' '{ print $2 }'`
    if [ "$HEXO_PORT" != "" ]; then
        cat $PROXY_CONF_TPL_FILE | sed -e "s/blog:HEXO_PORT/blog:$HEXO_PORT/" > $PROXY_CONF_FILE
    fi
fi

if [ -f "$PROXY_CONF_FILE" ]; then
    docker-compose up --build blog proxy
else
    echo Unable to find proxy file - $PROXY_CONF_FILE
fi

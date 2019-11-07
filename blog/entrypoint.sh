#! /bin/ash

BLOG_NAME=$1
HEXO_PORT=$2
GIT_REPO=$3

apk update;
apk add --no-cache git openssh
apk add --no-cache --update ca-certificates \
    && update-ca-certificates

mkdir -p ~/.ssh
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts

npm install --global hexo-cli
cd /hexo

if [ "$GIT_REPO" != "" ]; then
    git clone --recursive $GIT_REPO $BLOG_NAME
else
    echo "******************************************                 No git repo input? But why?"
    #hexo init $BLOG_NAME
    #npm install hexo-admin --save-dev --prefix=/hexo/$BLOG_NAME
fi

#cd $BLOG_NAME
#npm install
#hexo server -p $HEXO_PORT

FROM node:12.13.0-alpine

USER hexoblog


ARG HEXO_PORT
ARG BLOG_NAME
ARG GIT_REPO

ENV BLOG_NAME $BLOG_NAME
ENV HEXO_PORT $HEXO_PORT
ENV GIT_REPO $GIT_REPO

WORKDIR /hexo

EXPOSE $HEXO_PORT

RUN : \
    apk update && \
    apk add --no-cache git openssh && \
    apk add --no-cache --update ca-certificates && \
    update-ca-certificates && \
    mkdir -

ENTRYPOINT /hexo/entrypoint.sh $BLOG_NAME $HEXO_PORT $GIT_REPO

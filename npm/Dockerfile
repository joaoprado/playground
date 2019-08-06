#
#--------------------------------------------------------------------------
# Image Setup
#--------------------------------------------------------------------------
#

FROM alpine:latest
LABEL maintainer="João Prado <contato@joaoprado.com.br>"

RUN apk add --no-cache --update \
    nodejs nodejs-npm \
    git \
    python python-dev py-pip build-base \
    && npm i -g @vue/cli gulp npm-check \
    && rm -rf /var/cache/apk/* /tmp/*

RUN addgroup -g 1000 -S playground \
    && adduser -u 1000 -S playground -G playground

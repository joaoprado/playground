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
    python3

RUN ln -sf python3 /usr/bin/python

RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

RUN npm i -g @vue/cli gulp npm-check json-server \
    && rm -rf /var/cache/apk/* /tmp/*

RUN addgroup -g 1000 -S playground \
    && adduser -u 1000 -S playground -G playground

WORKDIR /usr/src
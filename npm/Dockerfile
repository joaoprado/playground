#
#--------------------------------------------------------------------------
# Image Setup
#--------------------------------------------------------------------------
#

FROM node:14-alpine
LABEL maintainer="João Prado <contato@joaoprado.com.br>"

RUN apk add --no-cache --update \
    git \
    python3

RUN ln -sf python3 /usr/bin/python

RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

RUN npm i -g @vue/cli gulp npm-check json-server \
    && rm -rf /var/cache/apk/* /tmp/*

WORKDIR /usr/src

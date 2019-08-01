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
    php7 php7-curl php7-bcmath php7-gd php7-json php7-mbstring \
    php7-mysqli php7-pdo php7-pdo_mysql php7-pdo_sqlite \
    php7-phar php7-zip php7-session \
    mariadb-client \
    composer \
    python python-dev py-pip build-base \
    && npm i -g @vue/cli gulp ionic npm-check \
    && rm -rf /var/cache/apk/* /tmp/*

RUN addgroup -g 1000 -S playground \
    && adduser -u 1000 -S playground -G playground

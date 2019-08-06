#
#--------------------------------------------------------------------------
# Image Setup
#--------------------------------------------------------------------------
#

FROM alpine:latest
LABEL maintainer="João Prado <contato@joaoprado.com.br>"

RUN apk add --no-cache --update \
    git openssh \
    php7 php7-curl php7-bcmath php7-gd php7-json php7-mbstring \
    php7-mysqli php7-pdo php7-pdo_mysql php7-pdo_sqlite \
    php7-phar php7-zip php7-session \
    php7-tokenizer php7-dom php7-xml php7-simplexml php7-xmlreader php7-fileinfo php7-ctype php7-xmlwriter \
    mariadb-client \
    composer \
    && rm -rf /var/cache/apk/* /tmp/*

RUN addgroup -g 1000 -S playground \
    && adduser -u 1000 -S playground -G playground

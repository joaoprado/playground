#
#--------------------------------------------------------------------------
# Image Setup
#--------------------------------------------------------------------------
#

FROM php:7.0-fpm-alpine
LABEL maintainer="João Prado <contato@joaoprado.com.br>"

RUN apk add --no-cache --update freetype-dev libpng-dev libjpeg-turbo-dev libxml2-dev tiff-dev ghostscript-dev autoconf g++ imagemagick-dev libtool make \
    imagemagick gcc libjpeg musl-dev jpeg-dev zlib zlib-dev libxml2 \
    && docker-php-ext-configure gd \
        --with-gd \
        --with-freetype-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
        --with-tiff-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install mysqli pdo_mysql \
    && docker-php-ext-install opcache \
    && docker-php-ext-install soap \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && apk del autoconf g++ libtool make \
    && rm -rf /tmp/* /var/cache/apk/*

RUN addgroup -g 1000 -S playground \
    && adduser -u 1000 -S playground -G playground

WORKDIR /usr/src
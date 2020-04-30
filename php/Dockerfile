#
#--------------------------------------------------------------------------
# Image Setup
#--------------------------------------------------------------------------
#

FROM php:7.4-alpine
LABEL maintainer="João Prado <contato@joaoprado.com.br>"

RUN apk add --no-cache --update \
    freetype freetype-dev \
    libjpeg-turbo libjpeg-turbo-dev \
    libpng libpng-dev \
    libwebp-dev \
    libxpm-dev \
    libzip-dev \
    zlib-dev \
    git openssh \
    mariadb-client \
    make \
    && rm -rf /var/cache/apk/* /tmp/*

RUN docker-php-ext-install bcmath iconv mysqli gd opcache pcntl pdo pdo_mysql zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=1.10.1 \
    && composer global require hirak/prestissimo

RUN addgroup -g 1000 -S playground \
    && adduser -u 1000 -S playground -G playground

COPY ./overrides.ini /usr/local/etc/php/conf.d/overrides.ini

ADD aliases.sh /etc/profile.d

WORKDIR /usr/src

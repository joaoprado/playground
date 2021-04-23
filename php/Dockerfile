#
#--------------------------------------------------------------------------
# Image Setup
#--------------------------------------------------------------------------
#

FROM php:7.4-alpine
LABEL maintainer="João Prado <contato@joaoprado.com.br>"

RUN apk add --no-cache --update \
    $PHPIZE_DEPS \
    freetype freetype-dev \
    libjpeg-turbo libjpeg-turbo-dev \
    libpng libpng-dev \
    libwebp-dev \
    libxpm-dev \
    libzip-dev \
    zlib-dev \
    imap-dev \
    openssl-dev git openssh \
    mariadb-client \
    bash make cmake curl linux-headers go \
    && rm -rf /var/cache/apk/* /tmp/*


COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

RUN pecl install pcov && docker-php-ext-enable pcov

RUN docker-php-ext-install bcmath iconv mysqli gd opcache pcntl pdo pdo_mysql zip

RUN pecl install grpc && docker-php-ext-enable grpc

RUN mkdir -p /usr/grpc && cd /usr/grpc && \
    git clone https://github.com/grpc/grpc.git && \
    cd grpc && \
    git submodule update --init && \
    mkdir -p cmake/build && \
    cd cmake/build && \
    cmake ../.. && \
    make protoc grpc_php_plugin

RUN addgroup -g 1000 -S playground \
    && adduser -u 1000 -S playground -G playground

COPY ./overrides.ini /usr/local/etc/php/conf.d/overrides.ini

ADD aliases.sh /etc/profile.d

WORKDIR /usr/src

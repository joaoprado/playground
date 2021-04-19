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
    make curl linux-headers \
    && rm -rf /var/cache/apk/* /tmp/*


COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

RUN pecl install pcov && docker-php-ext-enable pcov

RUN docker-php-ext-install bcmath iconv mysqli gd opcache pcntl pdo pdo_mysql zip

RUN pecl install grpc

RUN mkdir -p /tmp/protoc && \
    curl -L https://github.com/google/protobuf/releases/download/v3.2.0/protoc-3.2.0-linux-x86_64.zip > /tmp/protoc/protoc.zip && \
    cd /tmp/protoc && \
    unzip protoc.zip && \
    cp /tmp/protoc/bin/protoc /usr/local/bin && \
    cd /tmp && \
    rm -r /tmp/protoc && \
    docker-php-ext-enable grpc

RUN addgroup -g 1000 -S playground \
    && adduser -u 1000 -S playground -G playground

COPY ./overrides.ini /usr/local/etc/php/conf.d/overrides.ini

ADD aliases.sh /etc/profile.d

WORKDIR /usr/src

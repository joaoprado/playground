#
#--------------------------------------------------------------------------
# Image Setup
#--------------------------------------------------------------------------
#
FROM php:8.1-alpine
LABEL maintainer="João Prado <contato@joaoprado.com.br>"

RUN apk add --no-cache --update \
    $PHPIZE_DEPS \
    imagemagick-dev icu-dev zlib-dev jpeg-dev libpng-dev libzip-dev libgomp \
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
    nodejs npm git python3 \
    && rm -rf /var/cache/apk/* /tmp/* \
    && ln -sf python3 /usr/bin/python


COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

RUN docker-php-ext-configure gd --with-jpeg

RUN docker-php-ext-install intl pcntl gd exif zip bcmath mysqli gd opcache pdo pdo_mysql

RUN pecl install pcov && docker-php-ext-enable pcov

RUN python3 -m ensurepip && pip3 install --no-cache --upgrade pip setuptools

RUN npm i -g @vue/cli gulp npm-check json-server yarn

COPY ./overrides.ini /usr/local/etc/php/conf.d/overrides.ini

ADD aliases.sh /etc/profile.d

RUN addgroup -g 1000 -S playground \
    && adduser -u 1000 -S playground -G playground

WORKDIR /usr/src

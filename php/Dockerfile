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
    php7-phar php7-zip php7-session php7-posix php-pcntl \
    php7-tokenizer php7-dom php7-xml php7-simplexml php7-xmlreader php7-fileinfo php7-ctype php7-xmlwriter \
    mariadb-client \
    composer \
    python python-dev py-pip build-base \
    && rm -rf /var/cache/apk/* /tmp/*

RUN addgroup -g 1000 -S playground \
    && adduser -u 1000 -S playground -G playground

COPY ./overrides.ini /etc/php7/conf.d/overrides.ini
COPY ./composer.json /root/.composer/composer.json
RUN chown -R playground:playground /root/.composer

RUN composer global install
RUN git clone https://github.com/cmheisel/pywatch.git && cd pywatch && python setup.py install && cd .. && rm -rf pywatch

ADD aliases.sh /etc/profile.d

WORKDIR /usr/src
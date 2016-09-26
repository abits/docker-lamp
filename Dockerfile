FROM php:alpine

RUN apk add --no-cache \
    freetype \
    freetype-dev \
    icu \
    icu-libs \
    icu-dev \
    libjpeg-turbo \
    libjpeg-turbo-dev \
    libpng \
    libpng-dev \
    musl \
    php5-json \
    php5-intl \
    php5-mcrypt \
    php5-mysqli \
    php5-apcu \
    php5-gd \
    php5-cli \
    && docker-php-ext-install -j$(getconf _NPROCESSORS_ONLN) mcrypt json intl mysqli \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ \
    && docker-php-ext-install -j$(getconf _NPROCESSORS_ONLN) gd

EXPOSE 8000

VOLUME /usr/src/php
WORKDIR /usr/src/php

COPY bin/* /usr/local/bin/
COPY config/50-symfony-php.ini /usr/local/etc/php/conf.d


CMD ["/usr/local/bin/php", "/usr/src/php/app/console", "server:run", "0.0.0.0:8000"]

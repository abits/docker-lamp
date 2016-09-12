FROM php:5-alpine

RUN apk add --no-cache \
    ca-certificates \
	freetype \
	libpng \
	libjpeg-turbo \
	freetype-dev \
	libpng-dev \
	libjpeg-turbo-dev \
    libmcrypt \
    libcrypto1.0 \
    libssl1.0 \
    libltdl \
    musl \
    zlib \
    openssl-dev \
    libxml2-dev \
    php5-cli \
    php5-json \
    php5-intl \
    php5-mcrypt \
    php5-mysqli \
    php5-apcu \
    php5-gd \
    php5-soap \
    php5-zip \
    php5-openssl \
    && docker-php-ext-install -j$(getconf _NPROCESSORS_ONLN) mcrypt json intl mysqli zip soap openssl \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ \
    && docker-php-ext-install -j$(getconf _NPROCESSORS_ONLN) gd \
    && docker-php-ext-enable soap

EXPOSE 8000

COPY config/50-typo3-php.ini /usr/local/etc/php/conf.d
COPY config/AdditionalConfiguration.php /usr/local/etc/php/htdocs/typo3conf/AdditionalConfiguration.php

VOLUME /usr/src/php
WORKDIR /usr/src/php/htdocs

CMD ["/usr/local/bin/php", "-S", "0.0.0.0:8000"]

FROM php:5.6-alpine

RUN apk add --no-cache \
	freetype \
	libpng \
	libjpeg-turbo \
	freetype-dev \
	libpng-dev \
	libjpeg-turbo-dev \
    libmcrypt \
    libltdl \
    musl \
    php5-cli \
    php5-json \
    php5-intl \
    php5-mcrypt \
    php5-mysqli \
    php5-apcu \
    php5-gd \
    && docker-php-ext-install -j$(getconf _NPROCESSORS_ONLN) mcrypt json intl mysqli \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ \
    && docker-php-ext-install -j$(getconf _NPROCESSORS_ONLN) gd

EXPOSE 8000

COPY config/php.ini /usr/local/etc/php/

VOLUME /usr/src/php
WORKDIR /usr/src/php/htdocs

CMD ["/usr/local/bin/php", "-S", "0.0.0.0:8000"]

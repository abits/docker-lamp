FROM php:alpine

RUN apk add --no-cache \
    php5-json \
    php5-intl \
    php5-mcrypt \
    php5-mysql \
    php5-apcu \
    php5-gd

EXPOSE 8000

COPY config/php.ini /usr/local/etc/php/

VOLUME /usr/src/php
WORKDIR /usr/src/php/htdocs

CMD ["/usr/local/bin/php", "-S", "0.0.0.0:8000"]

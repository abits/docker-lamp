FROM php:alpine

RUN apk add --no-cache \
    php5-json \
    php5-intl \
    php5-mcrypt \
    php5-mysql \
    php5-apcu \
    php5-gd

EXPOSE 8000

VOLUME /usr/src/php
WORKDIR /usr/src/php

COPY bin/* /usr/local/bin/

CMD ["/usr/local/bin/php", "/usr/src/php/app/console", "server:run", "0.0.0.0:8000"]

FROM php:8.0-fpm

RUN usermod -u 1000 www-data

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    icu-devtools \
    libicu-dev\
    wget \
    curl \
    apt-utils \
    net-tools \
    librdkafka-dev

RUN pecl install xdebug && docker-php-ext-enable xdebug

RUN pecl install redis && docker-php-ext-enable redis

RUN pecl channel-update pecl.php.net

RUN pecl install apcu && docker-php-ext-enable apcu

RUN pecl install igbinary && docker-php-ext-enable igbinary

RUN docker-php-ext-install intl

RUN docker-php-ext-install sockets

RUN docker-php-ext-install bcmath

RUN docker-php-ext-install pdo pdo_mysql mysqli

RUN pecl install rdkafka && docker-php-ext-enable rdkafka
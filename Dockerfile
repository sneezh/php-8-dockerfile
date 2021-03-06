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
    git \
    zip \
    unzip \
    libzip-dev \
    sqlite3 \
    libsqlite3-dev \
    libpq-dev \
    librdkafka-dev

RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

RUN pecl install xdebug && docker-php-ext-enable xdebug

RUN pecl install redis && docker-php-ext-enable redis

RUN pecl channel-update pecl.php.net

RUN pecl install apcu && docker-php-ext-enable apcu

RUN pecl install igbinary && docker-php-ext-enable igbinary

RUN docker-php-ext-install intl

RUN docker-php-ext-install sockets

RUN docker-php-ext-install bcmath

RUN docker-php-ext-install zip

RUN docker-php-ext-install pdo pdo_mysql mysqli pdo_pgsql

RUN pecl install rdkafka && docker-php-ext-enable rdkafka
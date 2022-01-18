FROM php:7.3-fpm-alpine

# Install Additional dependencies
RUN apk update && apk add --no-cache \
    build-base shadow vim curl \
    php7 \
    php7-fpm \
    php7-common \
    php7-pdo \
    php7-pdo_mysql \
    php7-mysqli \
    php7-mcrypt \
    php7-mbstring \
    php7-xml \
    php7-openssl \
    php7-json \
    php7-phar \
    php7-zip \
    php7-gd \
    php7-dom \
    php7-session \
    php7-zlib

# Install mongo
RUN apk add autoconf gcc g++ make libffi-dev openssl-dev && pecl install mongodb \
&& echo "extension=mongodb.so" > /usr/local/etc/php/conf.d/ext-mongodb.ini

RUN pecl install redis && docker-php-ext-enable redis

# enable extension php
RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-enable pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer



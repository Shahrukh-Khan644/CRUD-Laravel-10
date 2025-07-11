FROM php:8.2-fpm-alpine

USER root

RUN apk add --no-cache \
    git curl zip unzip libpng-dev libzip-dev oniguruma-dev \
    freetype-dev

RUN docker-php-ext-configure gd

RUN docker-php-ext-install \
    pdo_mysql mbstring bcmath zip gd exif pcntl

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

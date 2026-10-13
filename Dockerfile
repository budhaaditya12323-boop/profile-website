FROM composer:2 AS vendor
WORKDIR /var/www/html
COPY composer.json composer.lock ./
RUN composer install --no-dev --no-interaction --prefer-dist --optimize-autoloader --no-scripts

FROM node:22-alpine AS assets
WORKDIR /var/www/html
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM php:8.4-fpm-alpine
WORKDIR /var/www/html

RUN apk add --no-cache \
        oniguruma-dev \
        libxml2-dev \
        icu-dev \
        libzip-dev \
        freetype-dev \
        libjpeg-turbo-dev \
        libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j"$(nproc)" \
        bcmath \
        exif \
        gd \
        intl \
        mbstring \
        opcache \
        pcntl \
        pdo_mysql \
        zip \
    && apk del oniguruma-dev libxml2-dev icu-dev libzip-dev freetype-dev libjpeg-turbo-dev libpng-dev

COPY --from=vendor /var/www/html/vendor ./vendor
COPY --from=assets /var/www/html/public/build ./public/build
COPY . .

RUN mkdir -p storage/framework/{cache,data,sessions,testing,views} storage/logs bootstrap/cache \
    && chown -R www-data:www-data storage bootstrap/cache

EXPOSE 9000
CMD ["php-fpm"]

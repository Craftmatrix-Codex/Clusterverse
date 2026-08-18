FROM php:8.4-fpm-bookworm AS runtime

ENV LOG_CHANNEL=stderr
WORKDIR /var/www

COPY --from=mlocati/php-extension-installer:latest /usr/bin/install-php-extensions /usr/local/bin/

RUN apt-get update && apt-get install -y --no-install-recommends nginx supervisor curl unzip \
    libfreetype6-dev libjpeg62-turbo-dev libpng-dev libwebp-dev libavif-dev libxpm-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp --with-avif --with-xpm \
    && docker-php-ext-install -j$(nproc) gd \
    && install-php-extensions intl mbstring opcache pcntl pdo_pgsql pdo_sqlite xml zip \
    && rm -rf /var/lib/apt/lists/*

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer
COPY . .

RUN composer install --no-dev --no-interaction --no-progress --prefer-dist --optimize-autoloader \
    && php artisan package:discover --ansi \
    && mkdir -p storage/framework/cache storage/framework/sessions storage/framework/views bootstrap/cache \
    && chown -R www-data:www-data storage bootstrap/cache \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

COPY deploy/nginx.conf /etc/nginx/sites-available/default
COPY deploy/php.ini /usr/local/etc/php/conf.d/rai.ini
COPY deploy/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY deploy/entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 80
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 CMD curl -f http://localhost/up || exit 1
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

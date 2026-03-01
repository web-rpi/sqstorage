FROM php:8.3-apache-bookworm

ENV APACHE_DOCUMENT_ROOT=/var/www/html \
    TZ=UTC

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libfreetype6-dev \
        libicu-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        tzdata \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j"$(nproc)" mysqli intl gettext gd pdo_mysql opcache \
    && a2enmod rewrite headers expires \
    && rm -rf /var/lib/apt/lists/*

COPY . /var/www/html/
COPY deploy/docker/apache-sqstorage.conf /etc/apache2/sites-available/000-default.conf
COPY deploy/docker/entrypoint.sh /usr/local/bin/sqstorage-entrypoint.sh

RUN chmod +x /usr/local/bin/sqstorage-entrypoint.sh \
    && chown -R www-data:www-data /var/www/html \
    && mkdir -p /var/www/html/smartyfolders /var/www/html/languages/locale

ENTRYPOINT ["/usr/local/bin/sqstorage-entrypoint.sh"]
CMD ["apache2-foreground"]

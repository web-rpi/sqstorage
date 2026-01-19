FROM php:8.3-apache

RUN apt-get update && apt-get install -y --no-install-recommends \
    pkg-config \
    libsqlite3-dev \
    zlib1g-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libfreetype6-dev \
    gettext \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
 && docker-php-ext-install -j"$(nproc)" \
    mysqli intl gettext gd pdo pdo_mysql


RUN a2enmod rewrite headers \
    && sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

WORKDIR /var/www/html
COPY . /var/www/html
COPY docker/templates/dba.php.tpl /opt/templates/dba.php.tpl

COPY docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]

#!/bin/sh
set -eu

ensure_dir() {
    dir_path="$1"
    mkdir -p "$dir_path"
    chown -R www-data:www-data "$dir_path"
}

write_dba_php() {
    cat > /var/www/html/support/dba.php <<EOF
<?php
    \$dbName = getenv('DB_NAME') ?: 'sqstorage';
    \$host = getenv('DB_HOST') ?: 'db';
    \$port = (int)(getenv('DB_PORT') ?: '3306');

    DB::\$user = getenv('DB_USER') ?: 'sqstorage';
    DB::\$password = getenv('DB_PASSWORD') ?: 'sqstorage';
    DB::\$dsn = 'mysql:host=' . \$host . ';port=' . \$port . ';charset=utf8mb4;dbname=' . \$dbName;

    DB::\$logfile = null;

    \$useRegistration = filter_var(getenv('USE_REGISTRATION'), FILTER_VALIDATE_BOOLEAN);
    \$usePrettyURLs = filter_var(getenv('USE_PRETTY_URLS'), FILTER_VALIDATE_BOOLEAN);
EOF

    chown www-data:www-data /var/www/html/support/dba.php
    chmod 664 /var/www/html/support/dba.php
}

write_php_ini() {
    cat > /usr/local/etc/php/conf.d/zz-sqstorage.ini <<EOF
memory_limit=${PHP_MEMORY_LIMIT:-256M}
upload_max_filesize=${PHP_UPLOAD_MAX_FILESIZE:-32M}
post_max_size=${PHP_POST_MAX_SIZE:-32M}
max_execution_time=${PHP_MAX_EXECUTION_TIME:-120}
date.timezone=${TZ:-UTC}
opcache.enable=1
opcache.validate_timestamps=1
EOF
}

configure_installer() {
    if [ "${SQSTORAGE_ENABLE_INSTALLER:-true}" = "true" ]; then
        touch /var/www/html/support/allow_install
        chown www-data:www-data /var/www/html/support/allow_install
        chmod 664 /var/www/html/support/allow_install
    else
        rm -f /var/www/html/support/allow_install
    fi
}

ensure_dir /var/www/html/support
ensure_dir /var/www/html/smartyfolders
ensure_dir /var/www/html/languages/locale
write_dba_php
write_php_ini
configure_installer

exec "$@"

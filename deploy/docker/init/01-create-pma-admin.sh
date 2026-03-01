#!/bin/sh
set -eu

if [ -z "${PMA_ADMIN_USER:-}" ] || [ -z "${PMA_ADMIN_PASSWORD:-}" ]; then
    echo "Skipping phpMyAdmin admin user creation because PMA_ADMIN_USER/PMA_ADMIN_PASSWORD is not fully set."
    exit 0
fi

mysql -uroot -p"${MARIADB_ROOT_PASSWORD}" <<SQL
CREATE USER IF NOT EXISTS '${PMA_ADMIN_USER}'@'%' IDENTIFIED BY '${PMA_ADMIN_PASSWORD}';
ALTER USER '${PMA_ADMIN_USER}'@'%' IDENTIFIED BY '${PMA_ADMIN_PASSWORD}';
GRANT ALL PRIVILEGES ON *.* TO '${PMA_ADMIN_USER}'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
SQL

# sqStorage Portainer Stack

This stack was designed to deploy sqStorage using Portainer and Docker. phpmyadmin is provided for DB maintenance.

## Components

- `app`: Apache + PHP 8.3 with the PHP extensions required by sqStorage
- `db`: separate persistent MariaDB container
- `phpmyadmin`: web UI for database administration
- `backup`: scheduled database and configuration backup service

## Features

- all runtime variables are stored in `.env`
- `support/dba.php` is generated from `.env` on every container start
- the database schema is initialized automatically on first startup
- a dedicated bootstrap service creates or updates the `phpMyAdmin` admin user idempotently
- the database runs persistently in its own MariaDB container
- the app container is intentionally stateless so image updates do not hide core application files
- `phpMyAdmin` uses a dedicated admin user instead of `root`
- weekly backups run every Sunday at `00:00` via `cron` inside the container
- backups include a database dump, `.env`, and `stack.yml`
- backups are written to a host path outside Docker-managed volumes

## Usage

1. `cp .env.example .env`
2. Adjust passwords and ports in `.env`
3. Set `BACKUP_HOST_DIR` to a persistent host path, ideally on an external drive or NAS mount
4. In Portainer, deploy the stack from this repository using `deploy/stack.yml`

## Endpoints

- sqStorage: `http://IP:SQSTORAGE_HTTP_PORT`
- phpMyAdmin: `http://IP:PHPMYADMIN_HTTP_PORT`

## Notes

If the stack has already been started with an older database configuration, changes to `DB_NAME`, `DB_USER`, or `DB_PASSWORD` may require reinitializing the database volume or adjusting the database manually.

The `phpMyAdmin` admin user is created or updated by the `db_admin_setup` service from `PMA_ADMIN_USER` and `PMA_ADMIN_PASSWORD`. This works even when the database volume already exists.

## Backup Strategy

- Schedule: Sunday at `00:00` via `BACKUP_SCHEDULE=0 0 * * 0`
- Contents: full SQL dump of the sqStorage database plus snapshots of `.env` and `stack.yml`
- Destination: the host path defined by `BACKUP_HOST_DIR`, so backups survive the Docker lifecycle
- Retention: `90` days by default via `BACKUP_RETENTION_DAYS`
- Restore: deploy a fresh empty system, restore `.env` and `stack.yml`, then import the SQL dump into MariaDB

A typical restore looks like this:

```bash
tar -xzf sqstorage_YYYY-MM-DD_HH-MM-SS.tar.gz
docker compose exec -T db mariadb -u"${DB_USER}" -p"${DB_PASSWORD}" "${DB_NAME}" < database.sql
```

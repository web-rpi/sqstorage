#!/bin/sh
set -eu

timestamp="$(date +%Y-%m-%d_%H-%M-%S)"
workdir="/tmp/backup-${timestamp}"
archive_prefix="${BACKUP_FILENAME_PREFIX:-sqstorage}"
backup_dir="${BACKUP_DIR:-/backups}"
retention_days="${BACKUP_RETENTION_DAYS:-90}"

mkdir -p "${workdir}" "${backup_dir}"

dump_file="${workdir}/database.sql"
meta_file="${workdir}/backup-meta.txt"

mysqldump \
    --single-transaction \
    --quick \
    --routines \
    --events \
    --triggers \
    -h"${DB_HOST}" \
    -P"${DB_PORT}" \
    -u"${DB_USER}" \
    -p"${DB_PASSWORD}" \
    "${DB_NAME}" > "${dump_file}"

cp /config/.env "${workdir}/.env"
cp /config/stack.yml "${workdir}/stack.yml"

cat > "${meta_file}" <<EOF
created_at=${timestamp}
db_host=${DB_HOST}
db_port=${DB_PORT}
db_name=${DB_NAME}
compose_project=${COMPOSE_PROJECT_NAME}
hostname=$(hostname)
EOF

archive_path="${backup_dir}/${archive_prefix}_${timestamp}.tar.gz"
tar -czf "${archive_path}" -C "${workdir}" .

find "${backup_dir}" -maxdepth 1 -type f -name "${archive_prefix}_*.tar.gz" -mtime +"${retention_days}" -delete
rm -rf "${workdir}"

echo "Backup written to ${archive_path}"

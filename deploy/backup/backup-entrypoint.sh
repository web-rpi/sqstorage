#!/bin/sh
set -eu

if [ "${BACKUP_ENABLED:-true}" != "true" ]; then
    echo "Backup service disabled via BACKUP_ENABLED=${BACKUP_ENABLED:-false}"
    exec tail -f /dev/null
fi

mkdir -p /backups

cat > /etc/crontabs/root <<EOF
${BACKUP_SCHEDULE:-0 0 * * 0} /usr/local/bin/backup-run.sh >> /var/log/backup.log 2>&1
EOF

echo "Configured backup schedule: ${BACKUP_SCHEDULE:-0 0 * * 0}"
exec crond -f -l 2

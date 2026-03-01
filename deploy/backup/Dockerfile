FROM alpine:3.20

RUN apk add --no-cache \
    bash \
    coreutils \
    mariadb-client \
    tzdata

COPY deploy/backup/backup-entrypoint.sh /usr/local/bin/backup-entrypoint.sh
COPY deploy/backup/backup-run.sh /usr/local/bin/backup-run.sh

RUN chmod +x /usr/local/bin/backup-entrypoint.sh /usr/local/bin/backup-run.sh

ENTRYPOINT ["/usr/local/bin/backup-entrypoint.sh"]

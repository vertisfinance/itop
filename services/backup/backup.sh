#!/bin/bash
set -e

. /utils.sh

mysqldump --host mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" > /backup/itop-$(date -u +"%Y-%m-%d-%H-%M-%Z").sql
set_backup_perms
find /backup -mtime +${BACKUP_RETENTION_DAYS:-1000} -delete

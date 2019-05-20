#!/bin/bash
set -e
################################################################################

. /utils.sh
################################################################################
set_backup_perms
################################################################################
if [ "$1" = 'createsecret' ] || [ "$1" = 'readsecret' ]; then
  . /secret.sh
  "wrapped_$1"
  exit 0
fi

MYSQL_ROOT_PASSWORD=$(readsecret MYSQL_ROOT_PASSWORD)
MYSQL_PASSWORD=$(readsecret MYSQL_PASSWORD)
LDAP_PASSWORD=$(readsecret LDAP_PASSWORD)


if [ "$1" = 'mysqld' ]; then
  docker-entrypoint.sh mysqld
fi

################################################################################
if [ "$1" = 'restore' ]; then
  array=()
  while IFS=  read -r -d $'\0'; do
    array+=("$REPLY")
  done < <(find /backup -type f -printf "%f\0" | sort -z)

  filename="$(ask_user "Which db backup would you like to use?" "${array[@]}")"

  mysql --host mysql -u root -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE" < /backup/$filename
  exit 0
fi

if [ "$1" = 'backup' ]; then
  ./backup.sh
  exit 0
fi

################################################################################
exec "$@"

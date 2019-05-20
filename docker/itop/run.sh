#!/bin/bash
set -e

. /utils.sh

################################################################################
if [ "$1" = 'createsecret' ] || [ "$1" = 'readsecret' ]; then
  . /src/docker/main/secrets.sh
  "wrapped_$1"
  exit 0
fi


MYSQL_ROOT_PASSWORD=$(readsecret MYSQL_ROOT_PASSWORD)
MYSQL_PASSWORD=$(readsecret MYSQL_PASSWORD)
LDAP_PASSWORD=$(readsecret LDAP_PASSWORD)
# Note: we don't just use "apache2ctl" here because it itself is just a shell-script wrapper around apache2 which provides extra functionality like "apache2ctl start" for launching apache2 in the background.
# (also, when run as "apache2ctl <apache args>", it does not use "exec", which leaves an undesirable resident shell process)
mkdir -p /var/www/html/data /var/www/html/log
chmod 444 /var/www/html/conf/production/config-itop.php
chown -R www-data:www-data /var/www/html/conf/production /var/www/html/conf /var/www/html/env-production /var/www/html/data /var/www/html/log

echo "auth_user = root" > /params
echo "auth_pwd = $MYSQL_ROOT_PASSWORD" >> /params

: "${APACHE_CONFDIR:=/etc/apache2}"
: "${APACHE_ENVVARS:=$APACHE_CONFDIR/envvars}"
if test -f "$APACHE_ENVVARS"; then
	. "$APACHE_ENVVARS"
fi

# Apache gets grumpy about PID files pre-existing
: "${APACHE_PID_FILE:=${APACHE_RUN_DIR:=/var/run/apache2}/apache2.pid}"
rm -f "$APACHE_PID_FILE"

exec apache2 -DFOREGROUND "$@"

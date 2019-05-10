# `.env`

```env
# Needed for compose
COMPOSE_FILE=docker-compose.yml:docker-compose.dev.yml
COMPOSE_PROJECT_NAME=vertis-docu
REGISTRY_URL=vertis-docker-registry:5000
VERSION=latest
SERVER_IP=127.0.0.1
LOG_DRIVER=json-file

# DEV/TEST/PROD
ENV=DEV

# Will be used for certificates, allowed hosts
HOST_NAME=dev.docu.vertis.com

# directories and files in ./backup will be owned by this user
BACKUP_UID=1000
# older db backup will be deleted
BACKUP_RETENTION_DAYS=10

# email settings
EMAIL_PORT=25
EMAIL_HOST=mail.vertis.com
EMAIL_USE_TLS=True

ADMIN_EMAIL=user@vertis.com
DEFAULT_FROM_EMAIL=bot@vertis.com
SERVER_EMAIL=bot@vertis.com
REWRITE_RECIPIENTS=user@vertis.com

# Enabled/disabled services
BACKUP=False
SESSION_CLEANER_SERVICE=False
SEND_MAIL_TASK=True
RETRY_DEFERRED_TASK=True

LDAP_HOST_NAME=vefserver01
LDAP_SEARCH_BASE=OU=Usr_VEFBUDlocal,DC=vertis,DC=local
LDAP_BIND_USERNAME=vertis\%s
```

# `.secret.env`

```env
# postgres certificates
PG_CERTIFICATE_KEY=
PG_CERTIFICATE_CRT=
PG_CERTIFICATE_CACERT=
DB_PASSWORD=

# nginx
SITE_CERTIFICATE_KEY=
SITE_CERTIFICATE_CRT=

# django
DJANGO_SECRET_KEY=
```

# Reset Migrations

## On `dev`

You should have a database reflecting the `release` state of the models. Just
run `migrate` on a fresh `release` branch (`make migrate`).

Check out the `migration-cleanup` branch and run:

```sh
docker-compose run --rm django find . -name __pycache__ -exec rm -rf {} +
docker-compose run --rm django with_django scripts/reset_migrations.py
```

Now the `migration-cleanup` branch can be merged to `release`.

## On `prod`

Refresh the version. There are no new migrations to apply, so only run

```sh
docker-compose run --rm django with_django scripts/reset_migrations.py
```

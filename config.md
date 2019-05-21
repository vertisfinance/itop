# `.env`

```env
COMPOSE_FILE=docker-compose.yml:docker-compose.dev.yml
COMPOSE_PROJECT_NAME=itop
REGISTRY_URL=vertis-docker-registry:5000
VERSION=latest


HOST=localhost

# EMAIL settings
EMAIL_HOST=mail.vertis.com
EMAIL_PORT=25
EMAIL_FROM=bot@vertis.com
EMAIL_RECIPIENT=gabor.egyed@vertis.com

# MYSQL settings
MYSQL_DATABASE=itop
MYSQL_USER=itop

# LDAP SETTINGS
DC_IP=192.168.1.2
DOMAIN=vertis
LDAP_USER=itop
BASE_DN=DC=vertis,DC=local
USER_QUERY=(|(&(samaccountname=%1$s)(objectCategory=User))(&(userprincipalname=%1$s)(objectCategory=User)))

# BACKUP
BACKUP=True
BACKUP_RUN_ON_START=False
BACKUP_UID=1000
BACKUP_RETENTION_DAYS=5
```

# `.secret.env`

```env
MYSQL_ROOT_PASSWORD= random string
MYSQL_PASSWORD= random string
LDAP_PASSWORD= ldap user password
```

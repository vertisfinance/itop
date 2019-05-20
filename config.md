# `.env`

```env
COMPOSE_FILE=docker-compose.yml:docker-compose.dev.yml
COMPOSE_PROJECT_NAME=itop
REGISTRY_URL=vertis-docker-registry:5000
VERSION=latest

HOST=http://localhost/

# EMAIL settings
EMAIL_HOST=mail.vertis.com
EMAIL_PORT=25
EMAIL_FROM=bot@vertis.com
EMAIL_RECIPIENT=gabor.egyed@vertis.com

# MYSQL settings
MYSQL_ROOT_PASSWORD=kacsa
MYSQL_DATABASE=itop
MYSQL_USER=itop
MYSQL_PASSWORD=kacsa

# LDAP SETTINGS
DC_IP=192.168.1.2
LDAP_USER=vertis\itop
LDAP_PASSWORD=Sz1m4tsz4ty0r
BASE_DN=DC=vertis,DC=local
USER_QUERY=(|(&(samaccountname=%1$s)(objectCategory=User))(&(userprincipalname=%1$s)(objectCategory=User)))

# BACKUP
BACKUP=True
BACKUP_RUN_ON_START=False
BACKUP_UID=1000
BACKUP_RETENTION_DAYS=5
```

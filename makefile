SHELL=/bin/bash

timestamp := $(shell date -u +"%Y-%m-%d-%H-%M")
usr := $(shell id -u):$(shell id -g)
devcompose := COMPOSE_FILE=docker-compose.yml:docker-compose.dev.yml

start_update:
	docker-compose up -d itop
	docker-compose exec itop chmod 777 /var/www/html/
	docker-compose exec itop mv /var/www/html/conf/production/config-itop.php /var/www/html/conf/production/old-config-itop.php
	docker-compose exec itop chmod -R 777 /var/www/html/conf/

end_update:
	docker-compose up -d itop
	docker-compose exec itop mv /var/www/html/conf/production/old-config-itop.php /var/www/html/conf/production/config-itop.php
	docker-compose exec itop chmod 644 /var/www/html/conf/production/config-itop.php

certificates:
	docker-compose run --rm -u $(usr) -w /src/.files postgres ./create_dev_certificates.sh

build:
	$(devcompose) docker-compose down
	$(devcompose) docker-compose build
	$(devcompose) docker-compose run --rm django django-admin createcachetable
	$(devcompose) docker-compose run --rm django collectstatic
	$(devcompose) docker-compose build
	$(devcompose) docker-compose down

.PHONY: backup
backup:
	docker-compose run --rm curator backup

restore:
	docker-compose down
	docker-compose run --rm curator restore
	docker-compose down

createsecret:
	@docker-compose run --rm -v "$(CURDIR):/project" \
	  mysql createsecret

readsecret:
	@docker-compose run -T --rm mysql readsecret

git_pull:
	git pull

push: git_pull build
	VERSION=$(timestamp) docker-compose build
	VERSION=$(timestamp) docker-compose push postgres
	docker-compose down
	@echo "========================="
	@echo "VERSION: $(timestamp)"
	@echo "========================="
	git tag $(timestamp)
	git push --tags

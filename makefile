SHELL=/bin/bash

timestamp := $(shell date -u +"%Y-%m-%d-%H-%M")
usr := $(shell id -u):$(shell id -g)
devcompose := COMPOSE_FILE=docker-compose.yml:docker-compose.dev.yml

start_update:
	docker-compose up -d itop
	docker-compose exec itop chmod 777 /var/www/html/
	docker-compose exec itop mv /var/www/html/conf/production/config-itop.php /var/www/html/conf/production/old-config-itop.php


certificates:
	docker-compose run --rm -u $(usr) -w /src/.files postgres ./create_dev_certificates.sh

build:
	$(devcompose) docker-compose down
	$(devcompose) docker-compose build
	$(devcompose) docker-compose run --rm django django-admin createcachetable
	$(devcompose) docker-compose run --rm django collectstatic
	$(devcompose) docker-compose build
	$(devcompose) docker-compose down

build_fast:
	docker-compose build
	docker-compose down

node_shell:
	docker-compose run --rm -u "$(usr)" build_js bash

main_shell:
	docker-compose run --rm -u "$(usr)" postgres bash

collectstatic:
	docker-compose run --rm django collectstatic

bash:
	docker-compose run --rm django bash $(shell id -u)

.PHONY: backup
backup:
	docker-compose run --rm backup backup

restore:
	docker-compose down
	docker-compose run --rm backup restore

makemessages:
	docker-compose run --rm django makemessages

makemigrations:
	docker-compose run --rm django makemigrations

shell_plus:
	docker-compose run --rm django django-admin shell_plus

migrate:
	docker-compose run --rm django migrate

createsecret:
	@docker-compose run --rm -u "$(usr)" -v "$(CURDIR):/project" \
	  postgres createsecret

readsecret:
	@docker-compose run -T --rm -u "$(usr)" postgres readsecret

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

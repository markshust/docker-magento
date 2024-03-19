SHELL := /usr/bin/env bash

args = `arg="$(filter-out $(firstword $(MAKECMDGOALS)),$(MAKECMDGOALS))" && echo $${arg:-${1}}`

green  = $(shell printf "\e[32;01m$1\e[0m")
yellow = $(shell printf "\e[33;01m$1\e[0m")
red    = $(shell printf "\e[33;31m$1\e[0m")

format = $(shell printf "%-40s %s" "$(call green,bin/$1)" $2)

comma:= ,

.DEFAULT_GOAL:=help

%:
	@:

help:
	@echo ""
	@echo "$(call yellow,Use the following CLI commands:)"
	@echo "$(call red,===============================)"
	@echo "$(call format,bash,'Drop into the bash prompt of your Docker container.')"
	@echo "$(call format,cache-clean,'Access the cache-clean CLI.')"
	@echo "$(call format,cli,'Run any CLI command without going into the bash prompt.')"
	@echo "$(call format,clinotty,'Run any CLI command with no TTY.')"
	@echo "$(call format,cliq,'Run any CLI command but pipe all output to /dev/null.')"
	@echo "$(call format,composer,'Run the composer binary.')"
	@echo "$(call format,copyfromcontainer,'Copy folders or files from container to host.')"
	@echo "$(call format,copytocontainer,'Copy folders or files from host to container.')"
	@echo "$(call format,create-user,'Create either an admin user or customer account.')"
	@echo "$(call format,cron,'Start or stop the cron service.')"
	@echo "$(call format,dev-urn-catalog-generate,'Generate URNs for PHPStorm and remap paths to local host.')"
	@echo "$(call format,devconsole,'Alias for n98-magerun2 dev:console.')"
	@echo "$(call format,devtools-cli-check,'Check & install the CLI devtools if missing from system.')"
	@echo "$(call format,download,'Download & extract specific Magento version to the src directory.')"
	@echo "$(call format,fixowns,'This will fix filesystem ownerships within the container.')"
	@echo "$(call format,fixperms,'This will fix filesystem permissions within the container.')"
	@echo "$(call format,grunt,'Run the grunt binary.')"
	@echo "$(call format,magento,'Run the Magento CLI.')"
	@echo "$(call format,mftf,'Run the Magento MFTF.')"
	@echo "$(call format,mysql,'Run the MySQL CLI with database config from env/db.env.')"
	@echo "$(call format,mysqldump,'Backup the Magento database.')"
	@echo "$(call format,n98-magerun2,'Access the n98-magerun2 CLI.')"
	@echo "$(call format,node,'Run the node binary.')"
	@echo "$(call format,npm,'Run the npm binary.')"
	@echo "$(call format,pwa-studio,'(BETA) Start the PWA Studio server.')"
	@echo "$(call format,redis,'Run a command from the redis container.')"
	@echo "$(call format,remove,'Remove all containers.')"
	@echo "$(call format,removeall,'Remove all containers$(comma) networks$(comma) volumes and images.')"
	@echo "$(call format,removevolumes,'Remove all volumes.')"
	@echo "$(call format,restart,'Stop and then start all containers.')"
	@echo "$(call format,root,'Run any CLI command as root without going into the bash prompt.')"
	@echo "$(call format,rootnotty,'Run any CLI command as root with no TTY.')"
	@echo "$(call format,setup,'Run the Magento setup process$(comma) with optional domain name.')"
	@echo "$(call format,setup-composer-auth,'Setup authentication credentials for Composer.')"
	@echo "$(call format,setup-domain,'Setup Magento domain name.')"
	@echo "$(call format,setup-grunt,'Install and configure Grunt JavaScript task runner.')"
	@echo "$(call format,setup-pwa-studio,'(BETA) Install PWA Studio.')"
	@echo "$(call format,setup-ssl,'Generate an SSL certificate for one or more domains.')"
	@echo "$(call format,setup-ssl-ca,'Generate a certificate authority and copy it to the host.')"
	@echo "$(call format,start,'Start all containers.')"
	@echo "$(call format,status,'Check the container status.')"
	@echo "$(call format,stop,'Stop all containers.')"
	@echo "$(call format,update,'Update your project to the latest version of docker-magento.')"
	@echo "$(call format,xdebug,'Disable or enable Xdebug.')"

bash:
	@./usr/bin/env bash

cache-clean:
	@./bin/cache-clean $(call args)

cli:
	@./bin/cli $(call args)

clinotty:
	@./bin/clinotty $(call args)

cliq:
	@./bin/cliq $(call args)

composer:
	@./bin/composer $(call args)

copyfromcontainer:
	@./bin/copyfromcontainer $(call args)

copytocontainer:
	@./bin/copytocontainer $(call args)

cron:
	@./bin/cron $(call args)

dev-urn-catalog-generate:
	@./bin/dev-urn-catalog-generate

devconsole:
	@./bin/devconsole

devtools-cli-check:
	@./bin/devtools-cli-check

download:
	@./bin/download $(call args)

fixowns:
	@./bin/fixowns $(call args)

fixperms:
	@./bin/fixperms $(call args)

grunt:
	@./bin/grunt $(call args)

magento:
	@./bin/magento $(call args)

mftf:
	@./bin/mftf $(call args)

mysql:
	@./bin/mysql $(call args)

mysqldump:
	@./bin/mysqldump $(call args)

n98-magerun2:
	@./bin/n98-magerun2 $(call args)

node:
	@./bin/node $(call args)

npm:
	@./bin/npm $(call args)

pwa-studio:
	@./bin/pwa-studio

redis:
	@./bin/redis $(call args)

remove:
	@./bin/remove

removeall:
	@./bin/removeall

removevolumes:
	@./bin/removevolumes

restart:
	@./bin/restart $(call args)

root:
	@./bin/root $(call args)

rootnotty:
	@./bin/rootnotty $(call args)

setup:
	@./bin/setup $(call args)

setup-composer-auth:
	@./bin/setup-composer-auth

setup-domain:
	@./bin/setup-domain $(call args)

setup-grunt:
	@./bin/setup-grunt

setup-pwa-studio:
	@./bin/setup-pwa-studio $(call args)

setup-ssl:
	@./bin/setup-ssl $(call args)

setup-ssl-ca:
	@./bin/setup-ssl-ca

start:
	@./bin/start $(call args)

status:
	@./bin/status

stop:
	@./bin/stop $(call args)

update:
	@./bin/update

xdebug:
	@./bin/xdebug $(call args)

SHELL := /bin/bash

args = `arg="$(filter-out $(firstword $(MAKECMDGOALS)),$(MAKECMDGOALS))" && echo $${arg:-${1}}`

green  = $(shell printf "\e[32;01m$1\e[0m")
yellow = $(shell printf "\e[33;01m$1\e[0m")
red    = $(shell printf "\e[33;31m$1\e[0m")

format = $(shell printf "%s %-38s %s" "$(call yellow,$1)" "$(call green,$2)" $3)

comma:= ,

.DEFAULT_GOAL:=help

%:
	@:

help:
	@echo ""
	@echo "$(call green,Use the following CLI commands:)"
	@echo "$(call red,===============================)"
	@echo "$(call format,make,help,'Print list of commands with comment.')"
	@echo "$(call format,make,bash,'Drop into the bash prompt of your Docker container.')"
	@echo "$(call format,make,cache-clean,'Access the cache-clean CLI.')"
	@echo "$(call format,make,cli,'Run any CLI command without going into the bash prompt.')"
	@echo "$(call format,make,clinotty,'Run any CLI command with no TTY.')"
	@echo "$(call format,make,cliq,'Run any CLI command but pipes all output to /dev/null.')"
	@echo "$(call format,make,composer,'Run the composer binary.')"
	@echo "$(call format,make,copyfromcontainer,'Copy folders or files from container to host.')"
	@echo "$(call format,make,copytocontainer,'Copy folders or files from host to container.')"
	@echo "$(call format,make,cron,'Start or stop the cron service.')"
	@echo "$(call format,make,dev-urn-catalog-generate,'Generate URNs for PHPStorm and remap paths to local host.')"
	@echo "$(call format,make,devconsole,'Alias for n98-magerun2 dev:console.')"
	@echo "$(call format,make,devtools-cli-check,'Check & install the CLI devtools if missing from system.')"
	@echo "$(call format,make,download,'Download & extract specific Magento version to the src directory.')"
	@echo "$(call format,make,fixowns,'This will fix filesystem ownerships within the container.')"
	@echo "$(call format,make,fixperms,'This will fix filesystem permissions within the container.')"
	@echo "$(call format,make,grunt,'Run the grunt binary.')"
	@echo "$(call format,make,magento,'Run the Magento CLI.')"
	@echo "$(call format,make,mftf,'Run the Magento MFTF.')"
	@echo "$(call format,make,mysql,'Run the MySQL CLI with database config from env/db.env.')"
	@echo "$(call format,make,mysqldump,'Backup the Magento database.')"
	@echo "$(call format,make,n98-magerun2,'Access the n98-magerun2 CLI.')"
	@echo "$(call format,make,node,'Run the node binary.')"
	@echo "$(call format,make,npm,'Run the npm binary.')"
	@echo "$(call format,make,pwa-studio,'(BETA) Start the PWA Studio server.')"
	@echo "$(call format,make,redis,'Run a command from the redis container.')"
	@echo "$(call format,make,remove,'Remove all containers.')"
	@echo "$(call format,make,removeall,'Remove all containers$(comma) networks$(comma) volumes$(comma) and images.')"
	@echo "$(call format,make,removevolumes,'Remove all volumes.')"
	@echo "$(call format,make,restart,'Stop and then start all containers.')"
	@echo "$(call format,make,root,'Run any CLI command as root without going into the bash prompt.')"
	@echo "$(call format,make,rootnotty,'Run any CLI command as root with no TTY.')"
	@echo "$(call format,make,setup,'Run the Magento setup process$(comma) with optional domain name.')"
	@echo "$(call format,make,setup-composer-auth,'Setup authentication credentials for Composer.')"
	@echo "$(call format,make,setup-domain,'Setup Magento domain name.')"
	@echo "$(call format,make,setup-grunt,'Install and configure Grunt JavaScript task runner.')"
	@echo "$(call format,make,setup-pwa-studio,'(BETA) Install PWA Studio.')"
	@echo "$(call format,make,setup-ssl,'Generate an SSL certificate for one or more domains.')"
	@echo "$(call format,make,setup-ssl-ca,'Generate a certificate authority and copy it to the host.')"
	@echo "$(call format,make,start,'Start all containers.')"
	@echo "$(call format,make,status,'Check the container status.')"
	@echo "$(call format,make,stop,'Stop all containers.')"
	@echo "$(call format,make,update,'Stop all containers.')"
	@echo "$(call format,make,xdebug,'Disable or enable Xdebug.')"

bash:
	@./bin/bash

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

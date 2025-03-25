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
	@echo "$(call format,analyse,'Run `phpstan analyse` within the container to statically analyse code, passing in directory to analyse.')"
	@echo "$(call format,bash,'Drop into the bash prompt of your Docker container.')"
	@echo "$(call format,blackfire,'Disable or enable Blackfire. Accepts argument `disable`, `enable`, or `status`.')"
	@echo "$(call format,cache-clean,'Access the cache-clean CLI.')"
	@echo "$(call format,check-dependencies,'Provides helpful recommendations for dependencies.')"
	@echo "$(call format,cli,'Run any CLI command without going into the bash prompt.')"
	@echo "$(call format,clinotty,'Run any CLI command with no TTY.')"
	@echo "$(call format,cliq,'Run any CLI command but pipe all output to /dev/null.')"
	@echo "$(call format,composer,'Run the composer binary.')"
	@echo "$(call format,configure-linux`,'Adds the Docker container IP address to /etc/hosts if not already present. Optionally enables port 9003 for Xdebug')"
	@echo "$(call format,copyfromcontainer,'Copy folders or files from container to host.')"
	@echo "$(call format,copytocontainer,'Copy folders or files from host to container.')"
	@echo "$(call format,create-user,'Create either an admin user or customer account.')"
	@echo "$(call format,cron,'Start or stop the cron service.')"
	@echo "$(call format,debug-cli,'Enable Xdebug for bin/magento, with an optional argument of the IDE key. Defaults to PHPSTORM.')"
	@echo "$(call format,deploy,'Runs the standard Magento deployment process commands. Pass extra locales besides `en_US` via an optional argument.')"
	@echo "$(call format,dev-test-run,' Facilitates running PHPUnit tests for a specified test type.')"
	@echo "$(call format,dev-urn-catalog-generate,'Generate URNs for PHPStorm and remap paths to local host.')"
	@echo "$(call format,devconsole,'Alias for n98-magerun2 dev:console.')"
	@echo "$(call format,docker-compose,'Support V1 (`docker-compose`) and V2 (`docker compose`) docker compose command, and use custom configuration files.')"
	@echo "$(call format,docker-start,'Start the Docker application (either Orbstack or Docker Desktop)"
	@echo "$(call format,docker-stats,'Display status for CPU$(comma) memory usage$(comma) and memory limit of currently-running Docker containers.')"
	@echo "$(call format,download,'Download & extract specific Magento version to the src directory.')"
	@echo "$(call format,ece-patches,'Run the Cloud Patches CLI.')"
	@echo "$(call format,fixowns,'This will fix filesystem ownerships within the container.')"
	@echo "$(call format,fixperms,'This will fix filesystem permissions within the container.')"
	@echo "$(call format,grunt,'Run the grunt binary.')"
	@echo "$(call format,install-php-extensions,'Install PHP extension in the container.')"
	@echo "$(call format,log,'Monitor the Magento log files. Pass no params to tail all files.')"
	@echo "$(call format,magento,'Run the Magento CLI.')"
	@echo "$(call format,magento-version,'Determine the Magento version installed in the current environment..')"
	@echo "$(call format,mftf,'Run the Magento MFTF.')"
	@echo "$(call format,mysql,'Run the MySQL CLI with database config from env/db.env.')"
	@echo "$(call format,mysqldump,'Backup the Magento database.')"
	@echo "$(call format,n98-magerun2,'Access the n98-magerun2 CLI.')"
	@echo "$(call format,node,'Run the node binary.')"
	@echo "$(call format,npm,'Run the npm binary.')"
	@echo "$(call format,phpcbf,'Auto-fix PHP_CodeSniffer errors with Magento2 options.')"
	@echo "$(call format,phpcs,'Run PHP_CodeSniffer with Magento2 options.')"
	@echo "$(call format,phpcs-json-report,'Run PHP_CodeSniffer with Magento2 options and save to `report.json` file.')"
	@echo "$(call format,pwa-studio,'(BETA) Start the PWA Studio server.')"
	@echo "$(call format,redis,'Run a command from the redis container.')"
	@echo "$(call format,remove,'Remove all containers.')"
	@echo "$(call format,removeall,'Remove all containers$(comma) networks$(comma) volumes and images.')"
	@echo "$(call format,removenetwork,'Remove a network associated with the current directory name.')"
	@echo "$(call format,removevolumes,'Remove all volumes.')"
	@echo "$(call format,restart,'Stop and then start all containers.')"
	@echo "$(call format,root,'Run any CLI command as root without going into the bash prompt.')"
	@echo "$(call format,rootnotty,'Run any CLI command as root with no TTY.')"
	@echo "$(call format,setup,'Run the Magento setup process$(comma) with optional domain name.')"
	@echo "$(call format,setup-composer-auth,'Setup authentication credentials for Composer.')"
	@echo "$(call format,setup-domain,'Setup Magento domain name.')"
	@echo "$(call format,setup-grunt,'Install and configure Grunt JavaScript task runner.')"
	@echo "$(call format,setup-install,'Automates the installation process for a Magento instance.')"
	@echo "$(call format,setup-integration-tests,'Script to set up integration tests.')"
	@echo "$(call format,setup-pwa-studio,'(BETA) Install PWA Studio.')"
	@echo "$(call format,setup-pwa-studio-sampledata,'This script makes it easier to install Venia sample data.')"
	@echo "$(call format,setup-ssl,'Generate an SSL certificate for one or more domains.')"
	@echo "$(call format,setup-ssl-ca,'Generate a certificate authority and copy it to the host.')"
	@echo "$(call format,spx,'Disable or enable output compression to enable or disbale SPX.')"
	@echo "$(call format,start,'Start all containers.')"
	@echo "$(call format,status,'Check the container status.')"
	@echo "$(call format,stop,'Stop all project containers.')"
	@echo "$(call format,stopall,'Stop all docker running containers.')"
	@echo "$(call format,test,'Run unit tests for a specific path.')"
	@echo "$(call format,update,'Update your project to the latest version of docker-magento.')"
	@echo "$(call format,xdebug,'Set a custom xdebug.mode, or check the current status and get all available modes . Accepts optional argument of mode `off`, `debug`, etc.')"


analyse:
	@./bin/analyse $(call args)

bash:
	@./usr/bin/env bash

cache-clean:
	@./bin/cache-clean $(call args)
	
check-dependencies:
	@./bin/check-dependencies

cli:
	@./bin/cli $(call args)

clinotty:
	@./bin/clinotty $(call args)

cliq:
	@./bin/cliq $(call args)

composer:
	@./bin/composer $(call args)

configure-linux:
	@./bin/configure-linux

copyfromcontainer:
	@./bin/copyfromcontainer $(call args)

copytocontainer:
	@./bin/copytocontainer $(call args)

cron:
	@./bin/cron $(call args)

debug-cli:
	@./bin/debug-cli $(call args)
	
deploy:
	@./bin/deploy $(call args)
	
dev-test-run:
	@./bin/dev-test-run
	
dev-urn-catalog-generate:
	@./bin/dev-urn-catalog-generate

devconsole:
	@./bin/devconsole

docker-compose:
	@./bin/docker-compose
	
docker-stats:
	@./bin/docker-stats
	
download:
	@./bin/download $(call args)

fixowns:
	@./bin/fixowns $(call args)

fixperms:
	@./bin/fixperms $(call args)
	
grunt:
	@./bin/grunt $(call args)

install-php-extensions:
	@./bin/install-php-extensions $(call args)
	
log:
	@./bin/log $(call args)
	
magento:
	@./bin/magento $(call args)
	
magento-version:
	@./bin/magento-version

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
	
phpcbf:
	@./bin/phpcbf $(call args)
	
phpcs:
	@./bin/phpcs $(call args)
	
phpcs-json-report:
	@./bin/phpcs-json-report $(call args)

pwa-studio:
	@./bin/pwa-studio

redis:
	@./bin/redis $(call args)

remove:
	@./bin/remove

removeall:
	@./bin/removeall

removenetwork:
	@./bin/removenetwork
	
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
	
setup-install:
	@./bin/setup-install $(call args)

setup-integration-tests:
	@./bin/setup-integration-tests
	
setup-pwa-studio:
	@./bin/setup-pwa-studio $(call args)

setup-pwa-studio-sampledata:
	@./bin/setup-pwa-studio-sampledata $(call args)
	
setup-ssl:
	@./bin/setup-ssl $(call args)

setup-ssl-ca:
	@./bin/setup-ssl-ca

spx:
	@./bin/spx $(call args)
	
start:
	@./bin/start $(call args)

status:
	@./bin/status

stop:
	@./bin/stop $(call args)

stopall:
	@./bin/stopall $(call args)
	
update:
	@./bin/update

xdebug:
	@./bin/xdebug $(call args)

<h1 align="center">markshust/docker-magento</h1>

<div align="center">
  <p>Mark Shust's Docker Configuration for Magento</p>
  <img src="https://img.shields.io/badge/magento-2.X-brightgreen.svg?logo=magento&longCache=true" alt="Supported Magento Versions" />
  <a href="https://hub.docker.com/r/markoshust/magento-php/" target="_blank"><img src="https://img.shields.io/docker/pulls/markoshust/magento-php.svg?label=php%20docker%20pulls" alt="Docker Hub Pulls - PHP" /></a>
  <a href="https://hub.docker.com/r/markoshust/magento-nginx/" target="_blank"><img src="https://img.shields.io/docker/pulls/markoshust/magento-nginx.svg?label=nginx%20docker%20pulls" alt="Docker Hub Pulls - Nginx" /></a>
  <a href="https://GitHub.com/Naereen/StrapDown.js/graphs/commit-activity" target="_blank"><img src="https://img.shields.io/badge/maintained%3F-yes-brightgreen.svg" alt="Maintained - Yes" /></a>
  <img src="https://img.shields.io/badge/apple%20silicon%20support-yes-brightgreen" alt="Apple Silicon Support" />
  <a href="https://opensource.org/licenses/MIT" target="_blank"><img src="https://img.shields.io/badge/license-MIT-blue.svg" /></a>
</div>

## Table of contents

- [Docker Hub](#docker-hub)
- [Free Course](#free-course)
- [Usage](#usage)
- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Updates](#updates)
- [Custom CLI Commands](#custom-cli-commands)
- [Misc Info](#misc-info)
- [Credits](#credits)
- [License](#license)

## Docker Hub

View Dockerfiles for the latest tags:

- [markoshust/magento-nginx (Docker Hub)](https://hub.docker.com/r/markoshust/magento-nginx/)
  - [`1.18`, `1.18-8`](https://github.com/markshust/docker-magento/tree/master/images/nginx/1.18)
- [markoshust/magento-php (Docker Hub)](https://hub.docker.com/r/markoshust/magento-php/)
  - [`8.1-fpm`, `8.1-fpm-1`](https://github.com/markshust/docker-magento/tree/master/images/php/8.1)
  - [`7.4-fpm`, `7.4-fpm-15`](https://github.com/markshust/docker-magento/tree/master/images/php/7.4)
- [markoshust/magento-elasticsearch (Docker Hub)](https://hub.docker.com/r/markoshust/magento-elasticsearch/)
  - [`7.16`, `7.16-0`](https://github.com/markshust/docker-magento/tree/master/images/elasticsearch/7.16)
- [markoshust/magento-rabbitmq (Docker Hub)](https://hub.docker.com/r/markoshust/magento-rabbitmq/)
  - [`3.9`, `3.9-0`](https://github.com/markshust/docker-magento/tree/master/images/rabbitmq/3.9)
- [markoshust/ssh (Docker Hub)](https://hub.docker.com/r/markoshust/magento-ssh/)
  - [`latest`](https://github.com/markshust/docker-magento/tree/master/images/ssh)

## Free Course

This course is sponsored by <a href="https://m.academy" target="_blank">M.academy</a>, the simplest way to learn Magento.

<a href="https://m.academy" target="_blank"><img src="https://raw.githubusercontent.com/markshust/docker-magento/master/docs/macademy-logo.png" alt="M.academy"></a>

A free screencast course is available (which was fully refreshed in December 2021), which details the basic usage of this project:

<a href="https://m.academy/courses/set-up-magento-2-development-environment-docker" target="_blank">
<img src="https://raw.githubusercontent.com/markshust/docker-magento/master/docs/set-up-magento-2-development-environment-docker-og.png" alt="Set Up a Magento 2 Development Environment with Docker" width="400"><br/>
Set Up a Magento 2 Development Environment with Docker
</a>

### Course Curriculm

#### Intro

- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/36738848" target="_blank">Quick hi & welcome from Mark!</a>
- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/36738860" target="_blank">About the course format</a>

#### Initial Project Setup

- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/9205849" target="_blank">Install Docker Desktop & configure preferences</a>
- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/8974570" target="_blank">Set up Magento with the automated onelinesetup script</a>
- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/9064259" target="_blank">Set up Magento manually from a custom Git branch</a>
- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/9283467" target="_blank">Set up Docker for an existing Magento project</a>

#### The Basics of docker-magento

- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/9064258" target="_blank">Execute docker-magento helper scripts</a>
- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/9331008" target="_blank">Start, stop, restart and check container status</a>
- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/9064269" target="_blank">Execute bin/magento and composer within Docker containers</a>
- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/36150902" target="_blank">Install Magento sample data</a>

#### Docker Filesystem & Data Volumes

- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/9064334" target="_blank">Understand Docker volumes & host bind mounts</a>
- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/9064338" target="_blank">Manage files & folders within Docker containers</a>

#### PhpStorm

- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/9748834" target="_blank">Set up a docker-magento project in PhpStorm</a>
- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/9763893" target="_blank">Set up the Magento PhpStorm plugin</a>

#### Xdebug

- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/9064478" target="_blank">Install the Xdebug helper browser plugin for Chrome & PhpStorm</a>
- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/9064482" target="_blank">Enable disable check the status of Xdebug</a>
- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/9064615" target="_blank">Configure PhpStorm for Xdebug connections</a>
- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/9064617" target="_blank">Trigger an Xdebug breakpoint in PhpStorm</a>
- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/36677538" target="_blank">Trigger an Xdebug breakpoint for CLI commands in PhpStorm</a>

#### Customize Server Configurations

- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/36702830" target="_blank">Understand the docker-compose application structure</a>
- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/36702861" target="_blank">Increase the PHP memory limit in php.ini</a>
- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/9064349" target="_blank">Increase the Nginx request timeout in nginx.conf</a>
- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/36703258" target="_blank">Increase the MySQL buffer pool size with command or in my.cnf</a>
- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/9064350" target="_blank">Install a new PHP extension by building a custom Docker image</a>
- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/14780970" target="_blank">Configure multi-store instances in Docker with Nginx</a>

## Usage

This configuration is intended to be used as a Docker-based development environment for Magento 2.

Folders:

- `images`: Docker images for nginx and php
- `compose`: sample setups with Docker Compose

> The Magento 1 version of this development environment has been deprecated and is no longer supported. PHP 5 was used as it's base, and that version has reached end-of-life. If you still wish to use this setup, please reference [compose/magento-1 on tag 20.1.1](https://github.com/markshust/docker-magento/tree/20.1.1/compose/magento-1), but please be aware these images are no longer maintained.

## Prerequisites

This setup assumes you are running Docker on a computer with at least 6GB of RAM allocated to Docker, a dual-core, and an SSD hard drive. [Download & Install Docker Desktop](https://www.docker.com/products/docker-desktop).

This configuration has been tested on Mac & Linux. Windows is supported through the use of Docker on WSL.

## Setup

### Automated Setup (New Project)

```bash
# Create your project directory then go into it:
mkdir -p ~/Sites/magento
cd $_

# Run this automated one-liner from the directory you want to install your project.
curl -s https://raw.githubusercontent.com/markshust/docker-magento/master/lib/onelinesetup | bash -s -- magento.test 2.4.5
```

The `magento.test` above defines the hostname to use, and the `2.4.5` defines the Magento version to install. Note that since we need a write to `/etc/hosts` for DNS resolution, you will be prompted for your system password during setup.

After the one-liner above completes running, you should be able to access your site at `https://magento.test`.

#### Install sample data

After the above installation is complete, run the following lines to install sample data:

```bash
bin/magento sampledata:deploy
bin/magento setup:upgrade
```

### Manual Setup

Same result as the one-liner above. Just replace `magento.test` references with the hostname that you wish to use.

#### New Projects

```bash
# Create your project directory then go into it:
mkdir -p ~/Sites/magento
cd $_

# Download the Docker Compose template:
curl -s https://raw.githubusercontent.com/markshust/docker-magento/master/lib/template | bash

# Download the version of Magento you want to use with:
bin/download 2.4.5

# or for Magento core development:
# docker-compose -f docker-compose.yml up -d
# bin/setup-composer-auth
# bin/cli git clone git@github.com:magento/magento2.git .
# bin/cli git checkout 2.4-develop
# bin/composer install

# Run the setup installer for Magento:
bin/setup magento.test

open https://magento.test
```

#### Existing Projects

```bash
# Take a backup of your existing database:
bin/mysqldump > ~/Sites/existing/magento.sql

# Create your project directory then go into it:
mkdir -p ~/Sites/magento
cd $_

# Download the Docker Compose template:
curl -s https://raw.githubusercontent.com/markshust/docker-magento/master/lib/template | bash

# Replace with existing source code of your existing Magento instance:
cp -R ~/Sites/existing src
# or: git clone git@github.com:myrepo.git src

# Start some containers, copy files to them and then restart the containers:
docker-compose -f docker-compose.yml up -d
bin/copytocontainer --all ## Initial copy will take a few minutes...

# Import existing database:
bin/mysql < ../existing/magento.sql

# Update database connection details to use the above Docker MySQL credentials:
# Also note: creds for the MySQL server are defined at startup from env/db.env
# vi src/app/etc/env.php

# Import app-specific environment settings:
bin/magento app:config:import

# Create a DNS host entry and setup Magento base url
bin/setup-domain yoursite.test

bin/restart

open https://magento.test
```

## Updates

To update your project to the latest version of `docker-magento`, run:

```
bin/update
```

We recommend keeping your docker config files in version control, so you can monitor the changes to files after updates. After reviewing the code updates and ensuring they updated as intended, run `bin/restart` to restart your containers to have the new configuration take effect.

It is recommended to keep your root docker config files in one repository, and your Magento code setup in another. This ensures the Magento base path lives at the top of one specific repository, which makes automated build pipelines and deployments easy to manage, and maintains compatibility with projects such as Magento Cloud.

## Custom CLI Commands

- `bin/analyse`: Run `phpstan analyse` within the container to statically analyse code, passing in directory to analyse. Ex. `bin/analyse app/code`
- `bin/bash`: Drop into the bash prompt of your Docker container. The `phpfpm` container should be mainly used to access the filesystem within Docker.
- `bin/cache-clean`: Access the [cache-clean](https://github.com/mage2tv/magento-cache-clean) CLI. Note the watcher is automatically started at startup in `bin/start`. Ex. `bin/cache-clean config full_page`
- `bin/cli`: Run any CLI command without going into the bash prompt. Ex. `bin/cli ls`
- `bin/clinotty`: Run any CLI command with no TTY. Ex. `bin/clinotty chmod u+x bin/magento`
- `bin/cliq`: The same as `bin/cli`, but pipes all output to `/dev/null`. Useful for a quiet CLI, or implementing long-running processes.
- `bin/composer`: Run the composer binary. Ex. `bin/composer install`
- `bin/copyfromcontainer`: Copy folders or files from container to host. Ex. `bin/copyfromcontainer vendor`
- `bin/copytocontainer`: Copy folders or files from host to container. Ex. `bin/copytocontainer --all`
- `bin/cron`: Start or stop the cron service. Ex. `bin/cron start`
- `bin/dev-urn-catalog-generate`: Generate URN's for PhpStorm and remap paths to local host. Restart PhpStorm after running this command.
- `bin/devconsole`: Alias for `bin/n98-magerun2 dev:console`
- `bin/download`: Download specific Magento version from Composer to the container, with an optional type of either "community" (default) or "enterprise". Ex. `bin/download 2.4.5 enterprise`
- `bin/fixowns`: This will fix filesystem ownerships within the container.
- `bin/fixperms`: This will fix filesystem permissions within the container.
- `bin/grunt`: Run the grunt binary. Ex. `bin/grunt exec`
- `bin/install-php-extensions`: Install PHP extension in the container. Ex. `bin/install-php-extensions sourceguardian`
- `bin/magento`: Run the Magento CLI. Ex: `bin/magento cache:flush`
- `bin/mftf`: Run the Magento MFTF. Ex: `bin/mftf build:project`
- `bin/mysql`: Run the MySQL CLI with database config from `env/db.env`. Ex. `bin/mysql -e "EXPLAIN core_config_data"` or`bin/mysql < magento.sql`
- `bin/mysqldump`: Backup the Magento database. Ex. `bin/mysqldump > magento.sql`
- `bin/n98-magerun2`: Access the [n98-magerun2](https://github.com/netz98/n98-magerun2) CLI. Ex: `bin/n98-magerun2 dev:console`
- `bin/node`: Run the node binary. Ex. `bin/node --version`
- `bin/npm`: Run the npm binary. Ex. `bin/npm install`
- `bin/phpcbf`: Auto-fix PHP_CodeSniffer errors with Magento2 options. Ex. `bin/phpcbf <path-to-extension>`
- `bin/phpcs`: Run PHP_CodeSniffer with Magento2 options. Ex. `bin/phpcs <path-to-extension>`
- `bin/phpcs-json-report`: Run PHP_CodeSniffer with Magento2 options and save to `report.json` file. Ex. `bin/phpcs-json-report <path-to-extension>`
- `bin/pwa-studio`: (BETA) Start the PWA Studio server. Note that Chrome will throw SSL cert errors and not allow you to view the site, but Firefox will.
- `bin/redis`: Run a command from the redis container. Ex. `bin/redis redis-cli monitor`
- `bin/remove`: Remove all containers.
- `bin/removeall`: Remove all containers, networks, volumes, and images.
- `bin/removevolumes`: Remove all volumes.
- `bin/restart`: Stop and then start all containers.
- `bin/root`: Run any CLI command as root without going into the bash prompt. Ex `bin/root apt-get install nano`
- `bin/rootnotty`: Run any CLI command as root with no TTY. Ex `bin/rootnotty chown -R app:app /var/www/html`
- `bin/setup`: Run the Magento setup process to install Magento from the source code, with optional domain name. Defaults to `magento.test`. Ex. `bin/setup magento.test`
- `bin/setup-composer-auth`: Setup authentication credentials for Composer.
- `bin/setup-domain`: Setup Magento domain name. Ex: `bin/setup-domain magento.test`
- `bin/setup-grunt`: Install and configure Grunt JavaScript task runner to compile .less files
- `bin/setup-pwa-studio`: (BETA) Install PWA Studio (requires NodeJS and Yarn to be installed on the host machine). Pass in your base site domain, otherwise the default `master-7rqtwti-mfwmkrjfqvbjk.us-4.magentosite.cloud` will be used. Ex: `bin/setup-pwa-studio magento.test`
- `bin/setup-ssl`: Generate an SSL certificate for one or more domains. Ex. `bin/setup-ssl magento.test foo.test`
- `bin/setup-ssl-ca`: Generate a certificate authority and copy it to the host.
- `bin/start`: Start all containers, good practice to use this instead of `docker-compose up -d`, as it may contain additional helpers.
- `bin/status`: Check the container status.
- `bin/stop`: Stop all project containers.
- `bin/stopall`: Stop all docker running containers
- `bin/update`: Update your project to the most recent version of `docker-magento`.
- `bin/xdebug`: Disable or enable Xdebug. Accepts params `disable` (default) or `enable`. Ex. `bin/xdebug enable`

## Misc Info

### Caching

For an improved developer experience, caches are automatically refreshed when related files are updated, courtesy of [cache-clean](https://github.com/mage2tv/magento-cache-clean). This means you can keep all of the standard Magento caches enabled, and this script will only clear the specific caches needed, and only when necessary.

To disable this functionality, uncomment the last line in the `bin/start` file to disable the watcher.

### Database

The hostname of each service is the name of the service within the `docker-compose.yml` file. So for example, MySQL's hostname is `db` (not `localhost`) when accessing it from within a Docker container. Elasticsearch's hostname is `elasticsearch`.

To connect to the MySQL CLI tool of the Docker instance, run:

```
bin/mysql
```

You can use the `bin/mysql` script to import a database, for example a file stored in your local host directory at `magento.sql`:

```
bin/mysql < magento.sql
```

You also can use `bin/mysqldump` to export the database. The file will appear in your local host directory at `magento.sql`:

```
bin/mysqldump > magento.sql
```

> Getting an "Access denied, you need (at least one of) the SUPER privilege(s) for this operation." message when running one of the above lines? Try running it as root with:
> ```
> bin/clinotty mysql -hdb -uroot -pmagento magento < src/backup.sql
> ```
> You can also remove the DEFINER lines from the MySQL backup file with:
> ```
> sed 's/\sDEFINER=`[^`]*`@`[^`]*`//g' -i src/backup.sql
> ```

### Composer Authentication

First setup Magento Marketplace authentication (details in the [DevDocs](http://devdocs.magento.com/guides/v2.0/install-gde/prereq/connect-auth.html)).

Copy `src/auth.json.sample` to `src/auth.json`. Then, update the username and password values with your Magento public and private keys, respectively. Finally, copy the file to the container by running `bin/copytocontainer auth.json`.

### Email / Mailcatcher

View emails sent locally through Mailcatcher by visiting [http://{yourdomain}:1080](http://{yourdomain}:1080). During development, it's easiest to test emails using a third-party module such as [https://github.com/mageplaza/magento-2-smtp](Mageplaza's SMTP module). Set the mailserver host to `mailcatcher` and port to `1080`.

### Redis

Redis is now the default cache and session storage engine, and is automatically configured & enabled when running `bin/setup` on new installs.

Use the following lines to enable Redis on existing installs:

**Enable for Cache:**

`bin/magento setup:config:set --cache-backend=redis --cache-backend-redis-server=redis --cache-backend-redis-db=0`

**Enable for Full Page Cache:**

`bin/magento setup:config:set --page-cache=redis --page-cache-redis-server=redis --page-cache-redis-db=1`

**Enable for Session:**

`bin/magento setup:config:set --session-save=redis --session-save-redis-host=redis --session-save-redis-log-level=4 --session-save-redis-db=2`

You may also monitor Redis by running: `bin/redis redis-cli monitor`

For more information about Redis usage with Magento, <a href="https://devdocs.magento.com/guides/v2.4/config-guide/redis/redis-session.html" target="_blank">see the DevDocs</a>.

### Xdebug & VS Code

Install and enable the PHP Debug extension from the [Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=felixfbecker.php-debug).

Otherwise, this project now automatically sets up Xdebug support with VS Code. If you wish to set this up manually, please see the [`.vscode/launch.json`](https://github.com/markshust/docker-magento/blame/master/compose/.vscode/launch.json) file.

### Xdebug & PhpStorm

1.  First, install the [Chrome Xdebug helper](https://chrome.google.com/webstore/detail/xdebug-helper/eadndfjplgieldjbigjakmdgkmoaaaoc). After installed, right click on the Chrome icon for it and go to Options. Under IDE Key, select PhpStorm from the list to set the IDE Key to "PHPSTORM", then click Save.

2.  Next, enable Xdebug debugging in the PHP container by running: `bin/xdebug enable`.

3.  Then, open `PhpStorm > Preferences > PHP` and configure:

    * `CLI Interpreter`
        * Create a new interpreter from the `From Docker, Vagrant, VM...` list.
        * Select the Docker Compose option.
        * For Server, select `Docker`. If you don't have Docker set up as a server, create one and name it `Docker`.
        * For Configuration files, add both the `docker-compose.yml` and `docker-compose.dev.yml` files from your project directory.
        * For Service, select `phpfpm`, then click OK.
        * Name this CLI Interpreter `phpfpm`, then click OK again.

    * `Path mappings`
        * There is no need to define a path mapping in this area.

4. Open `PhpStorm > Preferences > PHP > Debug` and ensure Debug Port is set to `9000,9003`.

5. Open `PhpStorm > Preferences > PHP > Servers` and create a new server:

    * For the Name, set this to the value of your domain name (ex. `magento.test`).
    * For the Host, set this to the value of your domain name (ex. `magento.test`).
    * Keep port set to `80`.
    * Check the "Use path mappings" box and map `src` to the absolute path of `/var/www/html`.

6. Go to `Run > Edit Configurations` and create a new `PHP Remote Debug` configuration.

    * Set the Name to the name of your domain (ex. `magento.test`).
    * Check the `Filter debug connection by IDE key` checkbox, select the Server you just setup.
    * For IDE key, enter `PHPSTORM`. This value should match the IDE Key value set by the Chrome Xdebug Helper.
    * Click OK to finish setting up the remote debugger in PHPStorm.

7. Open up `pub/index.php` and set a breakpoint near the end of the file.

    * Start the debugger with `Run > Debug 'magento.test'`, then open up a web browser.
    * Ensure the Chrome Xdebug helper is enabled by clicking on it and selecting Debug. The icon should turn bright green.
    * Navigate to your Magento store URL, and Xdebug should now trigger the debugger within PhpStorm at the toggled breakpoint.

### SSH

Since version `40.0.0`, this project supports connecting to Docker with SSH/SFTP. This means that if you solely use either PhpStorm or VSCode, you no longer need to selectively mount host volumes in order to gain bi-directional sync capabilities from host to container. This will enable full speed in the native filesystem, as all files will be stored directly in the `appdata` container volume, rather than being synced from the host. This is especially useful if you'd like to sync larger directories such as `generated`, `pub` & `vendor`.

Copy `docker-compose.dev-ssh.yml` to `docker-compose.dev.yml` before installing Magento to take advantage of this setup. Then, create an SFTP connection at  Preferences -> Build, Execution, Deployment -> Deployment. Connect to `localhost` and use `app` for the username & password. You can set additional options for working with Magento in PhpStorm at Preferences -> Build, Execution, Deployment -> Deployment -> Options.

Note that you must use your IDE's SSH/SFTP functionality, otherwise changes will not be synced. To re-sync your host environment at any time, run:

```
bin/copyfromcontainer --all
```

### Linux

Running Docker on Linux should be pretty straight-forward. Note that you need to run some [post install commands](https://docs.docker.com/install/linux/linux-postinstall/) as well as [installing Docker Compose](https://docs.docker.com/compose/install/) before continuing. These steps are taken care of automatically with Docker Desktop, but not on Linux.

Copy `docker-compose.dev-linux.yml` to `docker-compose.dev.yml` before installing Magento to take advantage of this setup.

#### The host.docker.internal hostname

The `host.docker.internal` hostname is used on Docker for Mac/Windows to reference the Docker daemon. On Linux, this hostname does not exist.

This hostname is [hard-coded in the php.ini file](https://github.com/markshust/docker-magento/blob/master/images/php/7.4/conf/php.ini#L8). To make this hostname resolve, add `"host.docker.internal:172.17.0.1"` to the `app.extra_hosts` parameter of `docker-compose.yml`, replacing `172.17.0.1` with the result of:

```
docker run --rm alpine ip route | awk 'NR==1 {print $3}'
```

You must also create a new entry in your `/etc/hosts` file using the same IP:

```
172.17.0.1 host.docker.internal
```

#### Extra settings

To enable Xdebug on Linux, you may also need to open port 9003 on the firewall by running:

```
sudo iptables -A INPUT -p tcp --dport 9003 -j ACCEPT
```

You may also have to increase a virtual memory map count on the host system which is required by [Elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/current/vm-max-map-count.html).

Add the following line to the `/etc/sysctl.conf` file on your host:

```
vm.max_map_count=262144
```

### Blackfire.io

These docker images have built-in support for Blackfire.io. To use it, first register your server ID and token with the Blackfire agent:

```
bin/root blackfire-agent --register --server-id={YOUR_SERVER_ID} --server-token={YOUR_SERVER_TOKEN}
```

Next, open up the `bin/start` helper script and uncomment the line:

```
#bin/root /etc/init.d/blackfire-agent start
```

Finally, restart the containers with `bin/restart`. After doing so, everything is now configured and you can use a browser extension to profile your Magento store with Blackfire.

### MFTF

To work with MFTF you will need to first enable the `selenium` image in the `docker-compose.dev.yml` file. Then, you will need to run the following.

1. Run mftf build process `bin/mftf build:project`. This should build the basic setup for mftf in your project.
2. Update the `extra_host` values to match your Magento URL and IP in `docker-compose.dev.yml`.
3. Update the values in `src/dev/tests/acceptance/.env`, including adding the new line `SELENIUM_HOST=selenium` to define the host Codeception should connect to.
4. Run a sample test `bin/mftf run:test AdminLoginSuccessfulTest`.
5. Update your `nginx.conf` file to allow access to the dev section with the following, before the final `deny all` section:

```
location ~* ^/dev/tests/acceptance/utils($|/) {
    root $MAGE_ROOT;
    location ~ ^/dev/tests/acceptance/utils/command.php {
        fastcgi_pass   fastcgi_backend;
        fastcgi_index  index.php;
        fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
        include        fastcgi_params;
    }
}
```

For debugging, you can connect to the selenium image using a VCN client.

- Connect with the VCN option and `127.0.0.1:5900`, (default password: `secret`)
- Run `bin/mftf doctor` to validate all sections are setup correctly.

Find more info [here](https://devdocs.magento.com/mftf/docs/getting-started.html) about mftf configuration.

### Grunt + LiveReload for Frontend Development

#### Create a new theme and make it active

Create your new theme at `app/design/frontend/VendorName/theme-name`, with the related `composer.json`, `registration.php` and `theme.xml` files.

Make your new theme active at Admin > Content > Design > Configuration. Click the Edit button next to Global Scope, and set the Applied Theme to your new theme name, and click Save Configuration.

#### Load the LiveReload client file

To create a connection to LiveReload, you'll need to insert the LiveReload script into your theme. You can do this by creating a file in your theme at `Magento_Theme/layout/default_head_blocks.xml` with the contents:

```xml
<?xml version="1.0"?>
<page xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="urn:magento:framework:View/Layout/etc/page_configuration.xsd">
    <head>
        <script defer="true" src="/livereload.js?port=443" src_type="url"/>
    </head>
</page>
```

The "?port=443" parameter is important, otherwise the `livereload.js` script won't work.

While we're at it, let's also create an initial LESS file so we have something to test. Create a new file in your theme at `web/css/source/_extend.less` with the contents:

```css
body {
    background: white;
}
```

You'll need to clear the Magento cache to enable your module, and make sure this layout XML update is properly loaded.

Your new theme should now be active at `https://yourdomain.test`. Since this is a new theme, it should appear the same as the parent theme defined in your theme.xml file, which is usually Blank.

#### Set up Grunt

Run `bin/setup-grunt`. This will set up the Grunt configuration files for your new theme. It's important to run this step after setting up your new theme, not before.

#### Start the Grunt watcher

Grunt can watch for filesystem changes by running `bin/grunt watch`. You can optionally pass in the `--verbose` or `-v` flag to toggle verbose mode on. This will let you know what's going on under the hood, so you can be sure it is compiling & watching the correct files, and updating them as changes are made.

#### LiveReload Browser extension

Running the `grunt watch` process also spawns the LiveReload server. Your browser needs to connect to this server, and this is done by installing the [LiveReload browser extension](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei?hl=en).

In your browser, be sure to also open the Google Chrome Dev Tools, go to the Network tab, and click "Disable cache". This will ensure the browser does not long-cache static file assets, such as JavaScript & CSS files, which is important during development.

Ensure the LiveReload browser icon has been toggled on, and refresh the page. We can confirm the LiveReload script is loaded by going to the Network tab and ensuring the `livereload.js` file is loaded, and that it also spawns off a new websocket request to `/livereload`.

#### Test LiveReload

Since this is all set, let's update the CSS file to a different background color:

```css
body {
    background: blue;
}
```

Upon saving this file, we will see the Grunt watcher detect the changes, and your browser should automatically load the new style without you needing to refresh the page, and without a full browser refresh.

## Credits

### M.academy

This course is sponsored by <a href="https://m.academy" target="_blank">M.academy</a>, the simplest way to learn Magento.

<a href="https://m.academy" target="_blank"><img src="https://raw.githubusercontent.com/markshust/docker-magento/master/docs/macademy-logo.png" alt="M.academy"></a>

### Mark Shust

My name is Mark Shust and I'm the creator of this repo. I'm a <a href="http://www.zend.com/en/yellow-pages/ZEND014633" target="_blank">Zend Certified Engineer</a> and <a href="https://www.youracclaim.com/users/mark-shust" target="_blank">Adobe Certified Magento Developer</a>, and have been involved since the early days of Magento (0.8!). I'm no longer available for consulting, but am creating course content full-time at <a href="https://m.academy" target="_blank">M.academy</a>.

You can follow me on Twitter <a href="https://twitter.com/MarkShust" target="_blank">@MarkShust</a>, connect with me on LinkedIn <a href="https://www.linkedin.com/in/MarkShust/" target="_blank">@MarkShust</a>, read my blog at <a href="https://markshust.com" target="_blank">markshust.com</a>, or contact me directly at <a href="mailto:mark@shust.com">mark@shust.com</a>.

## License

[MIT](https://opensource.org/licenses/MIT)

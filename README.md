<h1 align="center">markshust/docker-magento</h1>

<div align="center">
  <p>Mark Shust's Docker Configuration for Magento</p>
  <img src="https://img.shields.io/badge/magento-2.X-brightgreen.svg?logo=magento&longCache=true&style=flat-square" alt="Supported Magento Versions" />
  <a href="https://hub.docker.com/r/markoshust/magento-nginx/" target="_blank"><img src="https://img.shields.io/docker/pulls/markoshust/magento-nginx.svg?label=nginx%20docker%20pulls" alt="Docker Hub Pulls - Nginx" /></a>
  <a href="https://hub.docker.com/r/markoshust/magento-php/" target="_blank"><img src="https://img.shields.io/docker/pulls/markoshust/magento-php.svg?label=php%20docker%20pulls" alt="Docker Hub Pulls - PHP" /></a>
  <a href="https://GitHub.com/Naereen/StrapDown.js/graphs/commit-activity" target="_blank"><img src="https://img.shields.io/badge/maintained%3F-yes-brightgreen.svg?style=flat-square" alt="Maintained - Yes" /></a>
  <a href="https://opensource.org/licenses/MIT" target="_blank"><img src="https://img.shields.io/badge/license-MIT-blue.svg" /></a>
</div>

## Table of contents

- [Free Course](#free-course)
- [Docker Hub](#docker-hub)
- [Usage](#usage)
- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Updates](#updates)
- [Custom CLI Commands](#custom-cli-commands)
- [Misc Info](#misc-info)
- [Credits](#credits)
- [License](#license)

## Free Course

This course is sponsored by <a href="https://m.academy" target="_blank">M.academy</a>, the simplest way to learn Magento.

<a href="https://m.academy" target="_blank"><img src="https://raw.githubusercontent.com/markshust/docker-magento/master/docs/macademy-logo.png" alt="M.academy"></a>

A free screencast course is available, which details the basic usage of this project:

<a href="https://m.academy/courses/set-up-magento-2-development-environment-docker" target="_blank">
<img src="https://raw.githubusercontent.com/markshust/docker-magento/master/docs/set-up-magento-2-development-environment-docker-og.png" alt="Course image"><br />
<br />
Set Up a Magento 2 Development Environment with Docker
</a>

### Course Curriculm

#### Project Setup

- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/9205849" target="_blank">Setup Docker for Mac & configure preferences</a>
- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/9273365" target="_blank">Setup global Composer auth credentials</a>
- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/8974570" target="_blank">Automated setup for new installs</a>

#### Helper Scripts

- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/9064258" target="_blank">Run CLI commands within containers</a>
- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/9331008" target="_blank">Stop, start & restart containers</a>
- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/9064269" target="_blank">Run binaries within containers</a>

#### Docker Filesystem & Volumes

- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/9064334" target="_blank">Understand volumes & host bind mounts</a>
- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/9064338" target="_blank">Manage files & folders on containers</a>

#### Customize Server Configuration

- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/9064349" target="_blank">Customize the Nginx configuration</a>
- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/9064356" target="_blank">Quickly switch PHP versions</a>
- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/9064350" target="_blank">Install extensions & packages</a>
- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/9064477" target="_blank">Run additional services as containers</a>
- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/14780970" target="_blank">Configure multi-store instances</a>

#### PHPStorm & Xdebug

- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/9748834" target="_blank">Setup PHPStorm for a Magento Docker project</a>
- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/9763893" target="_blank">Generate XML URNs for a Magento Docker project</a>
- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/9064478" target="_blank">Install Xdebug browser plugin</a>
- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/9064482" target="_blank">Enable, disable, & check Xdebug</a>
- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/9064615" target="_blank">Configure PHPStorm for Xdebug</a>
- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/9064617" target="_blank">Trigger Xdebug breakpoints with PHPStorm</a>

#### Manual Setup (Optional)

- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/9064259" target="_blank">Manual setup for new Magento installs</a>
- <a href="https://courses.m.academy/courses/set-up-magento-2-development-environment-docker/lectures/9283467" target="_blank">Manual setup for an existing Magento instance</a>

## Docker Hub

View Dockerfiles:

- [markoshust/magento-nginx (Docker Hub)](https://hub.docker.com/r/markoshust/magento-nginx/)
  - 1.18
      - [`1.18`, `1.18-4`](https://github.com/markshust/docker-magento/tree/master/images/nginx/1.18)
      - [`1.18-3`](https://github.com/markshust/docker-magento/tree/34.0.0/images/nginx/1.18)
      - [`1.18-2`](https://github.com/markshust/docker-magento/tree/33.0.0/images/nginx/1.18)
      - [`1.18-1`](https://github.com/markshust/docker-magento/tree/31.0.1/images/nginx/1.18)
      - [`1.18-0`](https://github.com/markshust/docker-magento/tree/31.0.0/images/nginx/1.18)
- [markoshust/magento-php (Docker Hub)](https://hub.docker.com/r/markoshust/magento-php/)
  - 8.0 (available for alpha testing)
      - [`8.0-fpm-develop`](https://github.com/markshust/docker-magento/tree/master/images/php/8.0)
  - 7.4
      - [`7.4-fpm`, `7.4-fpm-7`](https://github.com/markshust/docker-magento/tree/master/images/php/7.4)
      - [`7.4-fpm-6`](https://github.com/markshust/docker-magento/tree/38.0.0/images/php/7.4)
      - [`7.4-fpm-5`](https://github.com/markshust/docker-magento/tree/37.0.2/images/php/7.4)
      - [`7.4-fpm-4`](https://github.com/markshust/docker-magento/tree/36.0.2/images/php/7.4)
      - [`7.4-fpm-3`](https://github.com/markshust/docker-magento/tree/36.0.1/images/php/7.4)
      - [`7.4-fpm-2`](https://github.com/markshust/docker-magento/tree/34.2.0/images/php/7.4)
      - [`7.4-fpm-1`](https://github.com/markshust/docker-magento/tree/34.1.0/images/php/7.4)
      - [`7.4-fpm-0`](https://github.com/markshust/docker-magento/tree/33.0.0/images/php/7.4)
  - 7.3
      - [`7.3-fpm`, `7.3-fpm-14`](https://github.com/markshust/docker-magento/tree/master/images/php/7.3)
      - [`7.3-fpm-13`](https://github.com/markshust/docker-magento/tree/38.0.0/images/php/7.3)
      - [`7.3-fpm-12`](https://github.com/markshust/docker-magento/tree/37.0.2/images/php/7.3)
      - [`7.3-fpm-11`](https://github.com/markshust/docker-magento/tree/36.0.2/images/php/7.3)
      - [`7.3-fpm-10`](https://github.com/markshust/docker-magento/tree/36.0.1/images/php/7.3)
      - [`7.3-fpm-9`](https://github.com/markshust/docker-magento/tree/34.2.0/images/php/7.3)
      - [`7.3-fpm-8`](https://github.com/markshust/docker-magento/tree/34.1.0/images/php/7.3)
      - [`7.3-fpm-7`](https://github.com/markshust/docker-magento/tree/33.0.0/images/php/7.3)
      - [`7.3-fpm-6`](https://github.com/markshust/docker-magento/tree/32.0.1/images/php/7.3)
      - [`7.3-fpm-5`](https://github.com/markshust/docker-magento/tree/30.0.0/images/php/7.3)
      - [`7.3-fpm-4`](https://github.com/markshust/docker-magento/tree/29.0.0/images/php/7.3)
      - [`7.3-fpm-3`](https://github.com/markshust/docker-magento/tree/28.0.0/images/php/7.3)
      - [`7.3-fpm-2`](https://github.com/markshust/docker-magento/tree/27.2.0/images/php/7.3)
      - [`7.3-fpm-1`](https://github.com/markshust/docker-magento/tree/26.0.0/images/php/7.3)
      - [`7.3-fpm-0`](https://github.com/markshust/docker-magento/tree/24.2.0/images/php/7.3)
- [markoshust/magento-elasticsearch (Docker Hub)](https://hub.docker.com/r/markoshust/magento-elasticsearch/)
  - 7
      - [`7.7`, `7.7.1-0`](https://github.com/markshust/docker-magento/tree/master/images/elasticsearch/7.7)
      - [`7.6`, `7.6.2-2`](https://github.com/markshust/docker-magento/tree/35.0.0/images/elasticsearch/7.6)
      - [`7.6.2-1`](https://github.com/markshust/docker-magento/tree/32.0.0/images/elasticsearch/7.6)
      - [`7.6.2-0`](https://github.com/markshust/docker-magento/tree/31.0.2/images/elasticsearch/7.6)

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

Run this automated one-liner from the directory you want to install your project.

```bash
curl -s https://raw.githubusercontent.com/markshust/docker-magento/master/lib/onelinesetup | bash -s -- magento.test 2.4.2
```

The `magento.test` above defines the hostname to use, and the `2.4.2` defines the Magento version to install. Note that since we need a write to `/etc/hosts` for DNS resolution, you will be prompted for your system password during setup.

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
# Download the Docker Compose template:
curl -s https://raw.githubusercontent.com/markshust/docker-magento/master/lib/template | bash

# Download the version of Magento you want to use with:
bin/download 2.4.2

# or for Magento core development:
# docker-compose -f docker-compose.yml up -d
# bin/setup-composer-auth
# bin/cli git clone git@github.com:magento/magento2.git .
# bin/cli git checkout 2.4-develop

# Create a DNS host entry for the site:
echo "127.0.0.1 ::1 magento.test" | sudo tee -a /etc/hosts

# Run the setup installer for Magento:
bin/setup magento.test

open https://magento.test
```

#### Existing Projects

```bash
# Download the Docker Compose template:
curl -s https://raw.githubusercontent.com/markshust/docker-magento/master/lib/template | bash

# Replace with existing source code of your existing Magento instance:
cp -R ~/Sites/existing src
# or: git clone git@github.com:myrepo.git src

# Create a DNS host entry for the site:
echo "127.0.0.1 ::1 yoursite.test" | sudo tee -a /etc/hosts

# Start some containers, copy files to them and then restart the containers:
docker-compose -f docker-compose.yml up -d
bin/copytocontainer --all ## Initial copy will take a few minutes...

# Import existing database:
bin/mysql < backups/magento.sql

# Update database connection details to use the above Docker MySQL credentials:
# Also note: creds for the MySQL server are defined at startup from env/db.env
# vi src/app/etc/env.php

# Import app-specific environment settings:
bin/magento app:config:import

# Set base URLs to local environment URL (if not defined in env.php file):
bin/magento config:set web/secure/base_url https://yoursite.test/
bin/magento config:set web/unsecure/base_url https://yoursite.test/

bin/restart

open https://magento.test
```

> For more details on how everything works, see the extended [setup readme](https://github.com/markshust/docker-magento/blob/master/SETUP.md).

## Updates

To update your project to the latest version of `docker-magento`, run:

```
bin/update
```

We recommend keeping your docker config files in version control, so you can monitor the changes to files after updates. After reviewing the code updates and ensuring they updated as intended, run `bin/restart` to restart your containers to have the new configuration take effect.

It is recommended to keep your root docker config files in one repository, and your Magento code setup in another. This ensures the Magento base path lives at the top of one specific repository, which makes automated build pipelines and deployments easy to manage, and maintains compatibility with projects such as Magento Cloud.

## Custom CLI Commands

- `bin/bash`: Drop into the bash prompt of your Docker container. The `phpfpm` container should be mainly used to access the filesystem within Docker.
- `bin/cache-clean`: Access the [cache-clean](https://github.com/mage2tv/magento-cache-clean) CLI. Note the watcher is automatically started at startup in `bin/start`. Ex. `bin/cache-clean config full_page`
- `bin/cli`: Run any CLI command without going into the bash prompt. Ex. `bin/cli ls`
- `bin/clinotty`: Run any CLI command with no TTY. Ex. `bin/clinotty chmod u+x bin/magento`
- `bin/cliq`: The same as `bin/cli`, but pipes all output to `/dev/null`. Useful for a quiet CLI, or implementing long-running processes.
- `bin/composer`: Run the composer binary. Ex. `bin/composer install`
- `bin/copyfromcontainer`: Copy folders or files from container to host. Ex. `bin/copyfromcontainer vendor`
- `bin/copytocontainer`: Copy folders or files from host to container. Ex. `bin/copytocontainer --all`
- `bin/dev-urn-catalog-generate`: Generate URN's for PHPStorm and remap paths to local host. Restart PHPStorm after running this command.
- `bin/devconsole`: Alias for `bin/n98-magerun2 dev:console`
- `bin/devtools-cli-check`: Check & install the CLI devtools if missing from system.
- `bin/download`: Download specific Magento version from Composer to `/var/www/html` directory within the container. Ex. `bin/download 2.4.2 community`
- `bin/fixowns`: This will fix filesystem ownerships within the container.
- `bin/fixperms`: This will fix filesystem permissions within the container.
- `bin/grunt`: Run the grunt binary. Ex. `bin/grunt exec`
- `bin/magento`: Run the Magento CLI. Ex: `bin/magento cache:flush`
- `bin/mysql`: Run the MySQL CLI with database config from `env/db.env`. Ex. `bin/mysql -e "EXPLAIN core_config_data"` or`bin/mysql < backups/magento.sql`
- `bin/mysqldump`: Backup the Magento database. Ex. `bin/mysqldump > backups/magento.sql`
- `bin/n98-magerun2`: Access the [n98-magerun2](https://github.com/netz98/n98-magerun2) CLI. Ex: `bin/n98-magerun2 dev:console`
- `bin/node`: Run the node binary. Ex. `bin/node --version`
- `bin/npm`: Run the npm binary. Ex. `bin/npm install`
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
- `bin/setup-grunt`: Install and configure Grunt JavaScript task runner to compile .less files
- `bin/setup-pwa-studio`: (BETA) Install PWA Studio (requires NodeJS and Yarn to be installed on the host machine). Pass in your base site domain, otherwise the default `master-7rqtwti-mfwmkrjfqvbjk.us-4.magentosite.cloud` will be used. Ex: `bin/setup-pwa-studio magento.test`
- `bin/setup-ssl`: Generate an SSL certificate for one or more domains. Ex. `bin/setup-ssl magento.test foo.test`
- `bin/setup-ssl-ca`: Generate a certificate authority and copy it to the host.
- `bin/start`: Start all containers, good practice to use this instead of `docker-compose up -d`, as it may contain additional helpers.
- `bin/status`: Check the container status.
- `bin/stop`: Stop all containers.
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

You can use the `bin/mysql` script to import a database, for example a file stored in your local host directory at `backups/magento.sql`:

```
bin/mysql < backups/magento.sql
```

You also can use `bin/mysqldump` to export the database. The file will appear in your local host directory at `backups/magento.sql`:

```
bin/mysqldump > backups/magento.sql
```

> Getting an "Access denied, you need (at least one of) the SUPER privilege(s) for this operation." message when running one of the above lines? Try running it as root with:
> ```
> bin/clinotty mysql -hdb -uroot -pmagento magento < src/backup.sql
> ```
> You can also remove the DEFINER lines from the MySQL backu pfile with:
> ```
> sed 's/\sDEFINER=`[^`]*`@`[^`]*`//g' -i src/backup.sql
> ```

### Composer Authentication

First setup Magento Marketplace authentication (details in the [DevDocs](http://devdocs.magento.com/guides/v2.0/install-gde/prereq/connect-auth.html)).

Copy `src/auth.json.sample` to `src/auth.json`. Then, update the username and password values with your Magento public and private keys, respectively. Finally, copy the file to the container by running `bin/copytocontainer auth.json`.

### Email / Mailhog

View emails sent locally through Mailhog by visiting [http://{yourdomain}:8025](http://{yourdomain}:8025)

### Redis

Redis is now the default cache and session storage engine, and is automatically configured & enabled when running `bin/setup` on new installs.

Use the following lines to enable Redis on existing installs:

**Enable for Cache:**

`bin/magento config:set --cache-backend=redis --cache-backend-redis-server=redis --cache-backend-redis-db=0`

**Enable for Full Page Cache:**

`bin/magento config:set --page-cache=redis --page-cache-redis-server=redis --page-cache-redis-db=1`

**Enable for Session:**

`bin/magento config:set --session-save=redis --session-save-redis-host=redis --session-save-redis-log-level=4 --session-save-redis-db=2`

You may also monitor Redis by running: `bin/redis redis-cli monitor`

For more information about Redis usage with Magento, <a href="https://devdocs.magento.com/guides/v2.4/config-guide/redis/redis-session.html" target="_blank">see the DevDocs</a>.

### Xdebug & VS Code

Install and enable the PHP Debug extension from the [Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=felixfbecker.php-debug).

Otherwise, this project now automatically sets up Xdebug support with VS Code. If you wish to set this up manually, please see the [`.vscode/launch.json`](https://github.com/markshust/docker-magento/blame/master/compose/.vscode/launch.json) file.

### Xdebug & PHPStorm

1.  First, install the [Chrome Xdebug helper](https://chrome.google.com/webstore/detail/xdebug-helper/eadndfjplgieldjbigjakmdgkmoaaaoc). After installed, right click on the Chrome icon for it and go to Options. Under IDE Key, select PHPStorm from the list and click Save.

2.  Next, enable Xdebug in the PHP-FPM container by running: `bin/xdebug enable`, the restart the docker containers (CTRL+C then `bin/start`).

3.  Then, open `PHPStorm > Preferences > Languages & Frameworks > PHP` and configure:

    * `CLI Interpreter`
        * Create a new interpreter and specify `From Docker`, and name it `markoshust/magento-php:7-2-fpm`.
        * Choose `Docker`, then select the `markoshust/magento-php:7-2-fpm` image name, and set the `PHP Executable` to `php`.

    * `Path mappings`
        * Don't do anything here as the next `Docker container` step will automatically setup a path mapping from `/var/www/html` to `./src`.

    * `Docker container`
        * Remove any pre-existing volume bindings.
        * Ensure a volume binding has been setup for Container path of `/var/www/html` mapped to the Host path of `./src`.

4. Open `PHPStorm > Preferences > Languages & Frameworks > PHP > Debug` and set Debug Port to `9001,9003`.

5. Open `PHPStorm > Preferences > Languages & Frameworks > PHP > DBGp Proxy` and set Port to `9001`.

6. Open `PHPStorm > Preferences > Languages & Frameworks > PHP > Servers` and create a new server:

    * Set Name and Host to your domain name (ex. `magento.test`)
    * Keep port set to `80`
    * Check the Path Mappings box and map `src` to the absolute path of `/var/www/html`

7. Go to `Run > Edit Configurations` and create a new `PHP Remote Debug` configuration by clicking the plus sign and selecting it. Set the Name to your domain (ex. `magento.test`). Check the `Filter debug connection by IDE key` checkbox, select the server you just setup, and under IDE Key enter `PHPSTORM`. This IDE Key should match the IDE Key set by the Chrome Xdebug Helper. Then click OK to finish setting up the remote debugger in PHPStorm.

8. Open up `src/pub/index.php`, and set a breakpoint near the end of the file. Go to `Run > Debug 'magento.test'`, and open up a web browser. Ensure the Chrome Xdebug helper is enabled by clicking on it > Debug. Navigate to your Magento store URL, and Xdebug within PHPStorm should now trigger the debugger and pause at the toggled breakpoint.

### Linux

Running Docker on Linux should be pretty straight-forward. Note that you need to run some [post install commands](https://docs.docker.com/install/linux/linux-postinstall/) as well as [installing Docker Compose](https://docs.docker.com/compose/install/). These steps are taken care of automatically with Docker Desktop, but not on Linux.

The `host.docker.internal` hostname is [hard-coded in the php.ini file](https://github.com/markshust/docker-magento/blob/master/images/php/7.4/conf/php.ini#L8), but this hostname does not exist on Linux. To make this hostname resolve, uncomment the `extra_hosts` param in the `docker-compose.dev.yml` file, and replace `IP` with result of:

```
docker run --rm alpine ip route | awk 'NR==1 {print $3}'
```

You may also have to increase a virtual memory map count on the host system. It is required by [Elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/current/vm-max-map-count.html).

Add following line to `/etc/sysctl.conf`:

```
vm.max_map_count=262144
```

To enable Xdebug on Linux, you'll also need to open port 9001 on the firewall by running:

```
sudo iptables -A INPUT -p tcp --dport 9001 -j ACCEPT
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

## Credits

### M.academy

This course is sponsored by <a href="https://m.academy" target="_blank">M.academy</a>, the simplest way to learn Magento.

<a href="https://m.academy" target="_blank"><img src="https://raw.githubusercontent.com/markshust/docker-magento/master/docs/macademy-logo.png" alt="M.academy"></a>

### Mark Shust

My name is Mark Shust and I'm the creator of this repo. I'm a <a href="http://www.zend.com/en/yellow-pages/ZEND014633" target="_blank">Zend Certified Engineer</a> and <a href="https://www.youracclaim.com/users/mark-shust" target="_blank">Adobe Certified Magento Developer</a>, and have been involved since the early days of Magento (0.8!). I'm no longer available for consulting, but am creating course content full-time at <a href="https://m.academy" target="_blank">M.academy</a>.

You can follow me on Twitter <a href="https://twitter.com/MarkShust" target="_blank">@MarkShust</a>, connect with me on LinkedIn <a href="https://www.linkedin.com/in/MarkShust/" target="_blank">@MarkShust</a>, read my blog at <a href="https://markshust.com" target="_blank">markshust.com</a>, or contact me directly at <a href="mailto:mark@shust.com">mark@shust.com</a>.

## License

[MIT](https://opensource.org/licenses/MIT)

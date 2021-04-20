<h1 align="center">markshust/docker-magento - Fork</h1>
<h3>Fork designed to work on the Mac com Apple Sillicon</h3>
<div>
  <p>To see the official README, go to the main project</p>
  <p>This README will show you how to install a new project or use existing projects on macs with M1</p>
</div>

## Prerequisites

This setup assumes you are running Docker on a computer with at least 4GB of allocated RAM, a dual-core, and an SSD hard drive. [Download & Install Docker Desktop](hhttps://docs.docker.com/docker-for-mac/apple-m1).

This configuration has been tested on Mac with M1.

## Setup

### Manual Setup

Same result as the one-liner above. Just replace `magento2.test` references with the hostname that you wish to use.

#### New Projects

```bash
# Download the Docker Compose template:
curl -s https://raw.githubusercontent.com/luancschmitz/docker-magento/master/lib/template | bash

# Build the images
docker-compose build

# Download the version of Magento you want to use with:
bin/download 2.4.1

# If the download fails, the script will attempt to download Magento with Composer

# or if you'd rather install with Composer, run:
#
# OPEN SOURCE:
#
# rm -rf src
# composer create-project --repository=https://repo.magento.com/ --ignore-platform-reqs --prefer-dist magento/project-community-edition=2.4.1 src
#
# COMMERCE:
#
# rm -rf src
# composer create-project --repository=https://repo.magento.com/ --ignore-platform-reqs --prefer-dist magento/project-enterprise-edition=2.4.1 src

# Create a DNS host entry for the site:
echo "127.0.0.1 ::1 magento2.test" | sudo tee -a /etc/hosts

# Run the setup installer for Magento:
bin/setup magento2.test

open https://magento2.test
```

#### Existing Projects

```bash
# Download the Docker Compose template:
curl -s https://raw.githubusercontent.com/luancschmitz/docker-magento/master/lib/template | bash

#Build the Images
docker-compose build

# Replace with existing source code of your existing Magento instance:
cp -R ~/Sites/existing src
# or: git clone git@github.com:myrepo.git src

# Create a DNS host entry for the site:
echo "127.0.0.1 ::1 yoursite.test" | sudo tee -a /etc/hosts

# Start some containers, copy files to them and then restart the containers:
docker-compose up -d
rm -rf src/vendor
bin/copytocontainer --all ## Initial copy will take a few minutes...

# Install composer dependencies, then copy artifacts back to the host (for debugging purposes):
bin/composer install
bin/copyfromcontainer vendor

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

open https://magento2.test
```

> For more details on how everything works, see the extended [setup readme](https://github.com/markshust/docker-magento/blob/master/SETUP.md).

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
- `bin/download`: Download & extract specific Magento version to the `src` directory. If the archive download fails, it will attempt to download with Composer. Ex. `bin/download 2.4.1`
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
- `bin/setup`: Run the Magento setup process to install Magento from the source code, with optional domain name. Defaults to `magento2.test`. Ex. `bin/setup magento2.test`
- `bin/setup-grunt`: Install and configure Grunt JavaScript task runner to compile .less files
- `bin/setup-pwa-studio`: (BETA) Install PWA Studio (requires NodeJS and Yarn to be installed on the host machine). Pass in your base site domain, otherwise the default `master-7rqtwti-mfwmkrjfqvbjk.us-4.magentosite.cloud` will be used. Ex: `bin/setup-pwa-studio magento2.test`
- `bin/setup-ssl`: Generate an SSL certificate for one or more domains. Ex. `bin/setup-ssl magento2.test magento3.test`
- `bin/setup-ssl-ca`: Generate a certificate authority and copy it to the host.
- `bin/start`: Start all containers, good practice to use this instead of `docker-compose up -d`, as it may contain additional helpers.
- `bin/status`: Check the container status.
- `bin/stop`: Stop all containers.
- `bin/update`: Update your project to the most recent version of `docker-magento`.
- `bin/xdebug`: Disable or enable Xdebug. Accepts params `disable` (default) or `enable`. Ex. `bin/xdebug enable`

## Credits

### M.academy

This course is sponsored by <a href="https://m.academy" target="_blank">M.academy</a>, which offers lessons and courses 100% dedicated to Magento 2.

<a href="https://m.academy" target="_blank"><img src="https://raw.githubusercontent.com/markshust/docker-magento/master/docs/macademy-logo.png" alt="M.academy"></a>

### Mark Shust

My name is Mark Shust and I'm the creator of this repo. I'm a <a href="http://www.zend.com/en/yellow-pages/ZEND014633" target="_blank">Zend Certified Engineer</a> and <a href="https://www.youracclaim.com/users/mark-shust" target="_blank">Adobe Certified Magento Developer</a>, and have been involved since the early days of Magento (0.8!). I'm no longer available for consulting, but am creating course content full-time at <a href="https://m.academy" target="_blank">M.academy</a>.

You can follow me on Twitter <a href="https://twitter.com/MarkShust" target="_blank">@MarkShust</a>, connect with me on LinkedIn <a href="https://www.linkedin.com/in/MarkShust/" target="_blank">@MarkShust</a>, read my blog at <a href="https://markshust.com" target="_blank">markshust.com</a>, or contact me directly at <a href="mailto:mark@shust.com">mark@shust.com</a>.

### Nexcess

A special thanks goes out to <a href="https://www.nexcess.net/" target="_blank">Nexcess</a> for hosting <a href="http://pubfiles.nexcess.net/magento/ce-packages/" target="_blank">public archives of every version of Magento</a> 💙. I've used their Magento hosting services in the past also (both <a href="https://www.nexcess.net/magento/hosting/" target="_blank">shared</a> and <a href="https://www.nexcess.net/magento/enterprise-hosting/" target="_blank">enteprise</a> offerings) and they're great, ...highly recommended!

## License

[MIT](https://opensource.org/licenses/MIT)

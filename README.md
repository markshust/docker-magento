Mark Shust's Magento Docker Configuration

## Docker Hub

View Dockerfiles:

- <a href="https://hub.docker.com/r/markoshust/magento-nginx/" target="_blank">markoshust/magento-nginx (Docker Hub)</a>
	- 1.13
		- [`latest`, `1.13`, `1.13-0`](https://github.com/markoshust/magento-docker/tree/master/images/nginx/1.13)
- <a href="https://hub.docker.com/r/markoshust/magento-php/" target="_blank">markoshust/magento-php (Docker Hub)</a>
	- 7.1
		- [`latest`, `7.1-fpm`, `7.1-fpm-1`](https://github.com/markoshust/magento-docker/tree/master/images/php/7.1)
		- [`7.1-fpm-0`](https://github.com/markoshust/magento-docker/tree/11.0.0/images/php/7.1)
	- 7.0
		- [`7.0-fpm`, `7.0-fpm-1`](https://github.com/markoshust/magento-docker/tree/master/images/php/7.0)
		- [`7.0-fpm-0`](https://github.com/markoshust/magento-docker/tree/11.0.0/images/php/7.0)
	- 5.6
		- [`5.6-fpm`, `5.6-fpm-1`](https://github.com/markoshust/magento-docker/tree/master/images/php/5.6)
		- [`5.6-fpm-0`](https://github.com/markoshust/magento-docker/tree/11.0.0/images/php/5.6)

## Usage

This configuration is intended to be used as a Docker-based development environment for both Magento 1 and Magento 2.

Folders:

- `images`: Docker images for nginx and php
- `compose`: sample setups with Docker Compose

Nginx assumes you are running Magento 2, however you can easily run it with Magento 1 using [the provided configuration file](https://github.com/markoshust/magento-docker/blob/master/images/nginx/1.13/conf/default.magento1.conf). Here is an [example of this setup with Docker Compose](https://github.com/markoshust/magento-docker/tree/master/compose/magento-1).

The PHP images are fairly agnostic to which version of Magento you are running. The PHP 5 images do assume you are running Magento 1, and the PHP 7 images do assume you are running Magento 2, however the main difference is cronjob setup, and they can be easily modified for inverse usage.

## Prerequisites

This setup relies on <a href="http://docker-sync.io/" target="_blank">docker-sync</a> for syncing host files to the container volume, and vice versa.

- `gem install docker-sync`
- `brew install coreutils`
- Ensure ports `80|443|3306|9000|9001` are not in use

You will also need to <a href="https://www.docker.com/community-edition#/download" target="_blank">Download & Install Docker Community Edition</a> on the host machine. This configuration has been tested on Mac, but should also work on Mac, Windows and Linux.

## Setup a New Magento 2 Project

1. Setup a new project using the Magento 2 compose skeleton:

```
mkdir magento && cd $_
git init
git remote add origin git@github.com:markoshust/magento-docker.git
git fetch origin
git checkout origin/master -- compose/magento-2
mv compose/magento-2/* .
rm -rf compose .git
git init
```

2. Set a custom name for the external volume. Within `docker-sync.yml` and `docker-compose-dev.yml` there are three references to `magento2_appdata`. Feel free to change these values to your project's name, for example `myapp_appdata`. This will be important when you want to run multiple Docker Compose setups with multiple projects.

3. Download the Magento source code to the `src` folder with: `./bin/download 2.2.2`

4. Start your Docker containers with: `./bin/start`. It will take a few moments (or many moments) for docker-sync to initially sync all of your host files back to the containers. Magento 2 has many, many files, so please be patient.

5. Setup your ip loopback for proper IP resolution with Docker: `./bin/initloopback`

6. Add an entry to `/etc/hosts` with your custom domain: `10.254.254.254 magento2.test` (assuming the domain  you want to setup is `magento2.test`). Be sure to use a `.test` tld, as `.localhost` and `.dev` will present issues with domain resolution.

7. Run Magento's setup install process with the command: `./bin/setup`. Feel free to edit this file to your liking; at the very least you will probably need to update the `base-url` value to the domain you setup in step 6.

8. You may now access your site at `http://magento2.test` (or whatever domain you setup). Note that initial page loads will take a bit of time. Once items are primed, everything should load quite fast.

## Existing Magento Project Setup

See the `compose` folder for sample setups for both Magento 1 and Magento 2. Basically your source code should go in the `src` folder, and you can then kick your project off with `./bin/start`. You may have to complete a few of the steps above to get things functioning properly.

## Custom CLI Commands

- `./bin/bash`: Drop into the bash prompt of your Docker container. The `phpfpm` container should be mainly used to access the filesystem within Docker.
- `./bin/cli`: Run any CLI command without going into the bash prompt. Ex. `./bin/cli ls`
- `./bin/composer`: Run the composer binary. Ex. `./bin/composer install`
- `./bin/download`: Download a version of Magento to the `src` directory. Ex. `./bin/download 2.2.2`
- `./bin/fixperms`: This will fix filesystem ownerships and permissions within Docker.
- `./bin/initloopback`: Setup your ip loopback for proper Docker ip resolution.
- `./bin/magento`: Run the Magento CLI. Ex: `./bin/magento cache:flush`
- `./bin/setup`: Run the Magento setup process to install Magento from the source code.
- `./bin/start`: Start the Docker Compose process and your app. Ctrl+C to stop the process.
- `./bin/xdebug`: Disable or enable Xdebug. Ex. `./bin/xdebug enable`

## Misc Info

### Database

- The hostname of each service is the name of the service within the `docker-compose.yml` file. So for example, MySQL's hostname is `db` (not `localhost`) when accessing it from a Docker container.

### PHPStorm & Xdebug

Within Xdebug, create a new `PHPStorm > Preferences > Languages & Frameworks > PHP > CLI Interpreter` and specify `From Docker`. Choose `Docker`, then select the `markoshust/magento-php:7-0-fpm` image name, and the `PHP Executable` to be `php`. Hitting the reload executable button should find the correct PHP Version and Xdebug debugger configuration.

Open `PHPStorm > Preferences > Languages & Frameworks > PHP > Debug` and set:

- IDE key: `PHPSTORM`
- Host: `10.254.254.254`
- Port: `9001`

Create a new server at  `PHPStorm > Preferences > Languages & Frameworks > PHP > Servers`. Set `localhost` as the name and host, check `Shared`, leave port `80`, and debugger `Xdebug`. Check `Use path mappings` and assigned the `src` File/Directory to the absolute path on the server of `/var/www/html`.

Create a new `PHP Remote Debug` configuration at `Run > Edit Configurations`. Name it `localhost`. Check `Filter debug connection by IDE Key`, select server `localhost`, and set IDE key to `PHPSTORM`.

Open up `src/pub/index.php`, and set a breakpoint near the end of the file. Go to `Run > Debug localhost`, and open up a web browser. Be sure to install a plugin like <a href="https://chrome.google.com/webstore/detail/xdebug-helper/eadndfjplgieldjbigjakmdgkmoaaaoc" target="_blank">Xdebug helper</a> which sets the IDE key to `PHPStorm` automatically for you. Enable the browser extension and activate it on the site, and reload the site. Xdebug within PHPStorm should now enable the debugger and stop at the toggled breakpoint.

### Composer Authentication

Please first setup Magento Marketplace authentication (details at <a href="http://devdocs.magento.com/guides/v2.0/install-gde/prereq/connect-auth.html" target="_blank">http://devdocs.magento.com/guides/v2.0/install-gde/prereq/connect-auth.html</a>).

Place your auth token at `~/.composer/auth.json` with the following contents, like so:

```
{
    "http-basic": {
        "repo.magento.com": {
            "username": "MAGENTO_PUBLIC_KEY",
            "password": "MAGENTO_PRIVATE_KEY"
        }
    }
}
```

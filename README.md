Mark Shust's Docker Configuration for Magento

## Docker Hub

View Dockerfiles:

- [markoshust/magento-nginx (Docker Hub)](https://hub.docker.com/r/markoshust/magento-nginx/)
  - 1.13
      - [`latest`, `1.13`, `1.13-6`](https://github.com/markoshust/docker-magento/tree/master/images/nginx/1.13)
      - [`1.13-5`](https://github.com/markoshust/docker-magento/tree/18.1.1/images/nginx/1.13)
      - [`1.13-4`](https://github.com/markoshust/docker-magento/tree/18.0.1/images/nginx/1.13)
      - [`1.13-3`](https://github.com/markoshust/docker-magento/tree/15.0.1/images/nginx/1.13)
      - [`1.13-2`](https://github.com/markoshust/docker-magento/tree/12.0.0/images/nginx/1.13)
      - [`1.13-1`](https://github.com/markoshust/docker-magento/tree/11.1.5/images/nginx/1.13)
      - [`1.13-0`](https://github.com/markoshust/docker-magento/tree/11.0.0/images/nginx/1.13)
- [markoshust/magento-php (Docker Hub)](https://hub.docker.com/r/markoshust/magento-php/)
  - 7.2
      - [`dev`, `7.2-fpm`](https://github.com/markoshust/docker-magento/tree/master/images/php/7.2)
  - 7.1
      - [`latest`, `7.1-fpm`, `7.1-fpm-9`](https://github.com/markoshust/docker-magento/tree/master/images/php/7.1)
      - [`7.1-fpm-8`](https://github.com/markoshust/docker-magento/tree/17.0.1/images/php/7.1)
      - [`7.1-fpm-7`](https://github.com/markoshust/docker-magento/tree/16.2.0/images/php/7.1)
      - [`7.1-fpm-6`](https://github.com/markoshust/docker-magento/tree/16.0.0/images/php/7.1)
      - [`7.1-fpm-5`](https://github.com/markoshust/docker-magento/tree/15.0.1/images/php/7.1)
      - [`7.1-fpm-4`](https://github.com/markoshust/docker-magento/tree/15.0.0/images/php/7.1)
      - [`7.1-fpm-3`](https://github.com/markoshust/docker-magento/tree/14.0.1/images/php/7.1)
      - [`7.1-fpm-2`](https://github.com/markoshust/docker-magento/tree/13.0.0/images/php/7.1)
      - [`7.1-fpm-1`](https://github.com/markoshust/docker-magento/tree/11.1.5/images/php/7.1)
      - [`7.1-fpm-0`](https://github.com/markoshust/docker-magento/tree/11.0.0/images/php/7.1)
  - 7.0
      - [`7.0-fpm`, `7.0-fpm-9`](https://github.com/markoshust/docker-magento/tree/master/images/php/7.0)
      - [`7.0-fpm-8`](https://github.com/markoshust/docker-magento/tree/17.0.1/images/php/7.0)
      - [`7.0-fpm-7`](https://github.com/markoshust/docker-magento/tree/16.2.0/images/php/7.0)
      - [`7.0-fpm-6`](https://github.com/markoshust/docker-magento/tree/16.0.0/images/php/7.0)
      - [`7.0-fpm-5`](https://github.com/markoshust/docker-magento/tree/15.0.1/images/php/7.0)
      - [`7.0-fpm-4`](https://github.com/markoshust/docker-magento/tree/15.0.0/images/php/7.0)
      - [`7.0-fpm-3`](https://github.com/markoshust/docker-magento/tree/14.0.1/images/php/7.0)
      - [`7.0-fpm-2`](https://github.com/markoshust/docker-magento/tree/13.0.0/images/php/7.0)
      - [`7.0-fpm-1`](https://github.com/markoshust/docker-magento/tree/11.1.5/images/php/7.0)
      - [`7.0-fpm-0`](https://github.com/markoshust/docker-magento/tree/11.0.0/images/php/7.0)
  - 5.6
      - [`5.6-fpm`, `5.6-fpm-6`](https://github.com/markoshust/docker-magento/tree/master/images/php/5.6)
      - [`5.6-fpm-5`](https://github.com/markoshust/docker-magento/tree/15.0.1/images/php/5.6)
      - [`5.6-fpm-4`](https://github.com/markoshust/docker-magento/tree/15.0.0/images/php/5.6)
      - [`5.6-fpm-3`](https://github.com/markoshust/docker-magento/tree/14.0.1/images/php/5.6)
      - [`5.6-fpm-2`](https://github.com/markoshust/docker-magento/tree/13.0.0/images/php/5.6)
      - [`5.6-fpm-1`](https://github.com/markoshust/docker-magento/tree/11.1.5/images/php/5.6)
      - [`5.6-fpm-0`](https://github.com/markoshust/docker-magento/tree/11.0.0/images/php/5.6)

## Usage

This configuration is intended to be used as a Docker-based development environment for both Magento 1 and Magento 2.

Folders:

- `images`: Docker images for nginx and php
- `compose`: sample setups with Docker Compose

Nginx assumes you are running Magento 2, however you can easily run it with Magento 1 using [the provided configuration file](https://github.com/markoshust/docker-magento/blob/master/images/nginx/1.13/conf/default.magento1.conf). Here is an [example of this setup with Docker Compose](https://github.com/markoshust/docker-magento/tree/master/compose/magento-1).

The PHP images are fairly agnostic to which version of Magento you are running. The PHP 5 images do assume you are running Magento 1, and the PHP 7 images do assume you are running Magento 2, however the main difference is cronjob setup, and they can be easily modified for inverse usage.

## Prerequisites

This setup assumes you are running Docker on a computer with at least 8GB RAM, a dual-core, and an SSD hard drive. [Download & Install Docker Community Edition](https://www.docker.com/community-edition#/download).

This configuration has been tested on Mac, Linux and Windows.

## Automated One Line Setup & Quick Setup (NEW!)

### One Line Setup

> Magento 2, OS X & Linux Only

Run this automated one-liner from the directory you want to install your project to:

```
curl -s https://raw.githubusercontent.com/markoshust/docker-magento/master/lib/onelinesetup|bash -s -- mymagento.test 2.2.6
```

The `mymagento.test` above defines the hostname to use, and the `2.2.6` defines the Magento version to install. Note that since we need a write to `/etc/hosts` for DNS resolution, you will be prompted for your system password during setup.

After the one-liner above completes running, you should be able to access your site at `http://mymagento.test`.

### Manual Quick Setup (New Project)

Same result as the one-liner above. Just replace `mymagento` references with the hostname that you wish to setup.

```
# Quick setup for a new instance of Magento 2, using magento226.test as a base:
curl -s https://raw.githubusercontent.com/markoshust/docker-magento/master/lib/template|bash -s -- magento-2

bin/download 2.2.6
# or if you'd rather install with Composer, run:
# rm -rf src
# composer create-project --repository=https://repo.magento.com/ --ignore-platform-reqs magento/project-community-edition src

echo "127.0.0.1 mymagento.test" | sudo tee -a /etc/hosts

bin/start

bin/setup mymagento.test

open http://mymagento.test
```

### Manual Quick Setup (Existing Project)

Just replace `mymagento.test` references with the hostname that you wish to use.

```
# Quick setup for an existing instance of Magento 2
curl -s https://raw.githubusercontent.com/markoshust/docker-magento/master/lib/template|bash -s -- magento-2

# Replace the contents of /src with the source code of your existing Magento instance

echo "127.0.0.1 mymagento.test" | sudo tee -a /etc/hosts

bin/start

bin/composer install

open http://mymagento.test
```

## Setup a New Magento 2 Project

1. Create the project template by going to the place you want the new project (ex. cd ~/Sites/magento2), then run
	- `curl -s https://raw.githubusercontent.com/markoshust/docker-magento/master/lib/template|bash -s -- magento-2`

2. Extract the contents of your current Magento site to the `src` folder, or download a fresh copy of the Magento source code for starting a new project with:
    - `bin/download 2.2.6`

3. Add an entry to your local hosts file with your custom domain. Assuming the domain you want to setup is `magento2.test`, enter the below. Be sure to use a `.test` tld, as `.localhost` and `.dev` will present issues with domain resolution.
    - `echo "127.0.0.1 magento226.test" | sudo tee -a /etc/hosts`

4. Start your Docker containers with the provided helper script:
    - `bin/start`

5. For new projects: run Magento's setup install process with the below helper script. Feel free to edit this file to your liking; at the very least you will probably need to update the `base-url` value to the domain you setup in step 3. Also, be sure to setup [Composer Authentication](https://github.com/markoshust/docker-magento#composer-authentication) before initiating the setup script.
    - `bin/setup`

6. You may now access your site! Check out whatever domain you setup from within a web browser.
    - `open http://magento2.test`

## Setup a New Magento 2 Project (Windows)

The following scripts are meant to run with Powershell. Note that the execution policy for scripts needs to be set accordingly [Execution policy](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/get-executionpolicy?view=powershell-6).

1. Create the project template by going to the place you want the new project (ex. cd ~/Sites/magento2), then run
	- `curl -s https://raw.githubusercontent.com/markoshust/docker-magento/master/lib/template|bash -s -- magento-2-windows`

2. Extract the contents of your current Magento site to the `src` folder, or download a fresh copy of the Magento source code for starting a new project with the following line. Note that the default untar command is quite slow. If you want to speed that up install [7-Zip](http://www.7-zip.org/) and add it to your PATH. The script will automatically use 7-Zip if it is available:
    - `bin/download 2.2.6`

3. Copy magento into the docker container with `bin/copymagento`. This is needed because of permission restrictions of shared data in Windows (see [Troubleshooting Docker](https://docs.docker.com/docker-for-windows/troubleshoot/#permissions-errors-on-data-directories-for-shared-volumes)). The `app` folder will however be shared with Windows for ease of development. For this folder the default permission 755 works just fine.

4. Add an entry to `C:\Windows\System32\drivers\etc\hosts` with your custom domain: `127.0.0.1 magento2.test` (assuming the domain  you want to setup is `magento2.test`). Be sure to use a `.test` tld, as `.localhost` and `.dev` will present issues with domain resolution.

5. Start your Docker containers with the provided helper script:
    - `bin/start`

6. For new projects: run Magento's setup install process with the below helper script. Feel free to edit this file to your liking; at the very least you will probably need to update the `base-url` value to the domain you setup in step 4. Also, be sure to setup [Composer Authentication](https://github.com/markoshust/docker-magento#composer-authentication) before initiating the setup script.
    - `bin/setup`

7. You may now access your site! Check out whatever domain you setup from within a web browser.
    - `open http://magento2.test`

## Custom CLI Commands

- `bin/bash`: Drop into the bash prompt of your Docker container. The `phpfpm` container should be mainly used to access the filesystem within Docker.
- `bin/dev-urn-catalog-generate`: Generate URN's for PHPStorm and remap paths to local host. Restart PHPStorm after running this command.
- `bin/cli`: Run any CLI command without going into the bash prompt. Ex. `bin/cli ls`
- `bin/composer`: Run the composer binary. Ex. `bin/composer install`
- `bin/copydir`: Copy a directory from the container to the host. Ex. `bin/copydir vendor`
- `bin/copydirall`: Copy all Magento directories from the container to the host. Ex. `bin/copydirall`
- `bin/download`: Download a version of Magento to the `src` directory. Ex. `bin/download 2.2.2`
- `bin/fixperms`: This will fix filesystem ownerships and permissions within Docker.
- `bin/grunt`: Run the grunt binary. Note that this runs the version from the node_modules directory for project version parity. Ex. `bin/grunt exec`
- `bin/magento`: Run the Magento CLI. Ex: `bin/magento cache:flush`
- `bin/node`: Run the node binary. Ex. `bin/node --version`
- `bin/npm`: Run the npm binary. Ex. `bin/npm install`
- `bin/remove`: Remove all containers. Ex. `bin/remove`
- `bin/restart`: Stop and then start all containers. Ex. `bin/restart`
- `bin/root`: Run any CLI command as root without going into the bash prompt. Ex `bin/root apt-get install nano`
- `bin/setup`: Run the Magento setup process to install Magento from the source code. Ex. `bin/setup`
- `bin/start`: Start all containers. This includes helper for bi-directional file sync, so be sure to use this instead of `docker-compose up -d`. Ex. `bin/start`
- `bin/stop`: Stop all containers. Ex. `bin/stop`
- `bin/xdebug`: Disable or enable Xdebug. Ex. `bin/xdebug enable`

## Misc Info

### Database

- The hostname of each service is the name of the service within the `docker-compose.yml` file. So for example, MySQL's hostname is `db` (not `localhost`) when accessing it from within a Docker container.

### Composer Authentication

First setup Magento Marketplace authentication (details in the [DevDocs](http://devdocs.magento.com/guides/v2.0/install-gde/prereq/connect-auth.html)).

After doing so, copy the auth sample file to:

- `cp src/auth.json.sample src/auth.json`

Then update the username and password values with your Magento public and private keys, respectively.

### Xdebug & VS Code

Install and enable the PHP Debug extension from the [Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=felixfbecker.php-debug).

Otherwise, this project now automatically sets up Xdebug support with VS Code. If you wish to set this up manually, please see the [`.vscode/launch.json`](https://github.com/markoshust/docker-magento/blame/master/compose/magento-2/.vscode/launch.json) file.

### Xdebug & PHPStorm

First, install the [Chrome Xdebug helper](https://chrome.google.com/webstore/detail/xdebug-helper/eadndfjplgieldjbigjakmdgkmoaaaoc). After installed, right click on the Chrome icon for it and go to Options. Under IDE Key, select PHPStorm from the list and click Save.

Next, enable Xdebug in the PHP-FPM container by running: `bin/xdebug enable`, the restart the docker containers (CTRL+C then `bin/start`).

Then, open `PHPStorm > Preferences > Languages & Frameworks > PHP` and configure:

- `CLI Interpreter`:
  - Create a new interpreter and specify `From Docker`, and name it `markoshust/magento-php:7-1-fpm`.
  - Choose `Docker`, then select the `markoshust/magento-php:7-1-fpm` image name, and set the `PHP Executable` to `php`.

- `Path mappings`:
  - Don't do anything here as the next `Docker container` step will automatically setup a path mapping from `/var/www/html` to `./src`.

- `Docker container`:
  - Remove any pre-existing volume bindings.
  - Ensure a volume binding has been setup for Container path of `/var/www/html` mapped to the Host path of `./src`.

Open `PHPStorm > Preferences > Languages & Frameworks > PHP > Debug` and set Debug Port to `9001`.

Open `PHPStorm > Preferences > Languages & Frameworks > PHP > DBGp Proxy` and set Port to `9001`.

Open `PHPStorm > Preferences > Languages & Frameworks > PHP > Servers` and create a new server:

- Set Name and Host to your domain name (ex. `magento2.test`)
- Set Port to `8000`
- Check the Path Mappings box and map `src` to the absolute path of `/var/www/html`

Go to `Run > Edit Configurations` and create a new `PHP Remote Debug` configuration by clicking the plus sign and selecting it. Set the Name to your domain (ex. `magento2.test`). Check the `Filter debug connection by IDE key` checkbox, select the server you just setup, and under IDE Key enter `PHPSTORM`. This IDE Key should match the IDE Key set by the Chrome Xdebug Helper. Then click OK to finish setting up the remote debugger in PHPStorm.

Open up `src/pub/index.php`, and set a breakpoint near the end of the file. Go to `Run > Debug 'magento2.test'`, and open up a web browser. Ensure the Chrome Xdebug helper is enabled by clicking on it > Debug. Navigate to your Magento store URL, and Xdebug within PHPStorm should now trigger the debugger and pause at the toggled breakpoint.

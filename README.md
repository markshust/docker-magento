This docker-compose.yml file is provided by Mage Inferno

Author: Mark Shust <mark.shust@mageinferno.com>

# Docker Hub
View our Docker Hub images at [https://hub.docker.com/u/mageinferno/](https://hub.docker.com/u/mageinferno/)

# Usage
This file is provided as an example development environment using Mage Inferno Magento 2 Docker Images. We suggest to supply specific version releases as this will maintain a consistent development environment (nginx:1.9 vs. nginx).

Create a new folder to house your project, ex: `~/Sites/mysite` then, please your docker-compose.yml file within this directory.

Setup will create a new directory at `~/Sites/mysite/src` which will hold all of the source files for Magento 2.

# Composer Setup
This setup attaches the `~/.composer` directory from the host machine. For fully automated setup, please first setup a GitHub Personal Access Token for Composer (before running setup) by visiting: [https://github.com/settings/tokens/new?scopes=repo&description=Composer](https://github.com/settings/tokens/new?scopes=repo&description=Composer)

then, place your auth token on your host machine at `~/.composer/auth.json`
with the following contents, like so:

`{ "github-oauth": { "github.com": "PERSONAL_ACCESS_TOKEN_GOES_HERE" } }`

# Running Setup
Before running Magento 2, you must download the source code, install composer dependencies, and execute the Magento installer script. Luckily, Mage Inferno makes this easy for you.

The following environment variables can be set for setup:
```
      - M2SETUP_DB_HOST=db
      - M2SETUP_DB_NAME=magento2
      - M2SETUP_DB_USER=magento2
      - M2SETUP_DB_PASSWORD=magento2
      - M2SETUP_BASE_URL=http://mysite.docker/
      - M2SETUP_ADMIN_FIRSTNAME=Admin
      - M2SETUP_ADMIN_LASTNAME=User
      - M2SETUP_ADMIN_EMAIL=dummy@gmail.com
      - M2SETUP_ADMIN_USER=magento2
      - M2SETUP_ADMIN_PASSWORD=magento2
      - M2SETUP_GITHUB_BRANCH=merchant_beta
      - M2SETUP_USE_SAMPLE_DATA=true
      - M2SETUP_PULL_GITHUB=true
      - M2SETUP_PULL_COMPOSER=true
      - M2SETUP_PULL_NODE_MODULES=true
      - M2SETUP_INSTALL=true
```

Our setup script uses these variables to determine how to setup your store. Everything is pretty self-explanatory, except the following:

- `M2SETUP_PULL_GITHUB`: Setting this to `true` will download the latest stable Magento 2 code from the `merchant_beta` branch (or `M2SETUP_GITHUB_BRANCH` if defined), and check it out to your projects `src` directory. If you already have the code checked out from your host machine, set this to `false`.
- `M2SETUP_PULL_COMPOSER`: Setting this to `true` will page through `composer.json` and install all composer dependencies to `src/vendor`. If you already have these installed, set this to `false`.
- `M2SETUP_PULL_NODE_MODULES`: Setting this to `true` will page through `package.json` and install all node module dependencies to `src/node_modules`. If you already have these installed, set this to `false`.
- `M2SETUP_INSTALL`: Setting this to `true` will install Magento 2 by the command line tool. If you already have Magento 2 installed, set this to `false`.

To run setup, execute the following command from your project directory (`~/Sites/mysite`), which creates a one-off throw away container that sets up Magento 2 for you.
`docker-compose run --rm setup`

Note that setup will take between 30 and 40 minutes to complete. A vast majority of this time is from downloading Composer dependencies, and installing sample data (configurable products, specifically). Setting `M2SETUP_USE_SAMPLE_DATA` to false will expedite the install process by skipping the installation of sample data.

# Data Volumes
This install will mount the `src` directory from your host machine to the Docker container (ex: `~/Sites/mysite/src`). Note that the persistancy comes from your host machine, so you may terminate running nginx/php containers and start them back up, and your data will remain. The `appdata` definition in the docker-compose.yml file is mainly there so we only have to define the relation in one place in the file, instead of it being defined multiple times.

For MySQL, the `mysqldata` container runs from the `tianon/true` volume. This makes a persistent Docker volume, however be aware that removing this container will remove all of your MySQL data (aka your database). Even though it appears as exited/stopped when running `docker ps -a`, be sure not to remove this container, as your MySQL data will truly go away if you remove it.

# App Virtual Host
This docker-compose file is catered to [Dinghy](https://github.com/codekitchen/dinghy), which uses it's own DNS Server and HTTP Proxy. Notice the `VIRTUAL_HOST=mysite.docker` definition for the `app` container. Dinghy uses this to create an HTTP Proxy, so your site can be access at [http://mysite.docker](http://mysite.docker). Note that all virtual names must end in `.docker` for proper DNS resolution by Dinghy.

This docker-compose.yml file is provided by Mage Inferno

Author: Mark Shust <mark.shust@mageinferno.com>

## Docker Hub

View our Docker Hub images at [https://hub.docker.com/u/mageinferno/](https://hub.docker.com/u/mageinferno/)

## Usage

This file is provided as an example development environment using Mage Inferno Magento 2 Docker Images. We suggest to supply specific version releases as this will maintain a consistent development environment (nginx:1.9 vs. nginx).

Create a new folder to house your project, ex: `~/Sites/mysite` then, please your docker-compose.yml file within this directory.

Setup will create a new directory at `~/Sites/mysite/src` which will hold all of the source files for Magento 2.

## docker-compose.yml

```
# Mage Inferno Docker Compose (https://github.com/mageinferno/magento2-docker-compose)
# Version 1.0

app:
  image: mageinferno/magento2-nginx:1.9.9-0
  ports:
    - "80:80"
  links:
    - php-fpm
    - db
  volumes_from:
    - appdata

appdata:
  image: tianon/true
  volumes:
    - /src
    - ~/.composer:/root/.composer

"php-fpm":
  image: mageinferno/magento2-php:7.0.0-fpm-0
  links:
    - db
  volumes_from:
    - appdata

db:
  image: mariadb:10.0.22
  ports:
    - "3306:3306"
  volumes_from:
    - dbdata
  environment:
    - MYSQL_ROOT_PASSWORD=magento2
    - MYSQL_DATABASE=magento2
    - MYSQL_USER=magento2
    - MYSQL_PASSWORD=magento2

dbdata:
  image: tianon/true
  volumes:
    - /var/lib/mysql

setup:
  image: mageinferno/magento2-setup:2.0.0-0
  links:
    - db
  volumes_from:
    - appdata
  environment:
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
    - M2SETUP_USE_SAMPLE_DATA=true
```

## Composer Setup

This setup attaches the `~/.composer` directory from the host machine. For fully automated setup, please first setup a GitHub Personal Access Token for Composer (before running setup) by visiting <a href="https://github.com/settings/tokens/new?scopes=repo&description=Composer" target="_blank">https://github.com/settings/tokens/new?scopes=repo&description=Composer</a>.

You'll also need to retrieve your Magento development keys. Please see <a href="http://devdocs.magento.com/guides/v2.0/install-gde/prereq/connect-auth.html" target="_blank">http://devdocs.magento.com/guides/v2.0/install-gde/prereq/connect-auth.html</a> for more details.

After both sets of keys are retrieved, place your auth token on your host machine at `~/.composer/auth.json` with the following contents, like so:

```
{
    "http-basic": {
        "repo.magento.com": {
            "username": "MAGENTO_PUBLIC_KEY",
            "password": "MAGENTO_PRIVATE_KEY"
        }
    },
    "github-oauth": {
        "github.com": "GITHUB_ACCESS_TOKEN"
    }
}
```

## Composer-less, No-Auth Setup

If you don't want to use Composer or setup the auth keys above, no worries. Magento provides a complete Magento 2 archive at <a href="http://devdocs.magento.com/guides/v2.0/install-gde/prereq/zip_install.html" target="_blank">http://devdocs.magento.com/guides/v2.0/install-gde/prereq/zip_install.html</a>. We decided to use this method for a very quick installation.

- The `2.0.0-[TAG]` image installs Magento 2 and all dependencies with Composer, then runs the CLI installer.
- The `2.0.0-archive-[TAG]` image installs Magento 2 from an archive (without sample data), then runs the CLI installer.
- The `2.0.0-archivesd-[TAG]` image installs Magento 2 from an archive (with sample data), then runs the CLI installer.

## Running Setup

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
- M2SETUP_USE_SAMPLE_DATA=true
```

Our setup script uses these variables to determine how to setup your store. Everything is pretty self-explanatory. The `M2_USE_SAMPLE_DATA` variable is only used with Composer-based installs.

To run setup, execute the following command from your project directory (`~/Sites/mysite`), which creates a one-off throw away container that sets up Magento 2 for you.
`docker-compose run --rm setup`

## Data Volumes

This install will mount a `src` directory as a docker volume. Note that the persistancy comes from your host machine, so you may terminate running nginx/php containers and start them back up, and your data will remain. The `appdata` definition in the docker-compose.yml file is mainly there so we only have to define the relation in one place in the file, instead of it being defined multiple times.

For MySQL, the `mysqldata` container runs from the `tianon/true` volume. This makes a persistent Docker volume, however be aware that removing this container will remove all of your MySQL data (aka your database). Even though it appears as exited/stopped when running `docker ps -a`, be sure not to remove this container, as your MySQL data will truly go away if you remove it.

## OS X / Dinghy

To use this image on other systems for local development, create a Dockerfile with anything specific to your local development platform.

For example, if using [Dinghy](https://github.com/codekitchen/dinghy) on OS X, use:

```
FROM mageinferno/magento2-php:[TAG]
RUN usermod -u 501 magento
```

Then build your custom image:

```
docker build -t myname/php .
```

Remember to add your `VIRTUAL_HOST` environment variable to the web server container in your docker-compose.yml file, and remove `ports` as those are automatically exposed in Dinghy.

### Host Volumes

Previously, we mounted this entire src directory from the host to the volume, but this made things pretty slow. Instead, we are now recommending mounting /src as a standard Docker volume (not connected to the host). Install Magento 2, then issue a command like the following on your host machine:

```
docker cp CONTAINERID:/src ./
```

This will copy the contents of the entire /src directory to your host machine. Since you shouldn't be modifying any of these files, this is just to bring the fully copy of the site back to your host.

Then, just mount your host `app/code` directory in your `appdata` container definition, and re-start your containers:

```
appdata:
  image: tianon/true
  volumes:
    - /src
    - ./src/app/code:/src/app/code
    - ~/.composer:/root/.composer
```

```
docker-compose up -d app
```

This will restart your container with `app/code` mounted from your host machine, so any edits to this directory will correctly sync with your Docker volume.

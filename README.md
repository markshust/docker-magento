This docker-compose.yml file is provided by Mage Inferno

Author: Mark Shust <mark.shust@mageinferno.com>

## Docker Hub

View our Docker Hub images at [https://hub.docker.com/u/mageinferno/](https://hub.docker.com/u/mageinferno/)

## Usage

This file is provided as an example development environment using Mage Inferno Magento 2 Docker Images.

## docker-compose.yml

```
# Mage Inferno Docker Compose (https://github.com/mageinferno/magento2-docker-compose)
# Version 4.0.0

app:
  image: mageinferno/magento2-nginx:1.9.14-0
  links:
    - phpfpm
    - db
  volumes_from:
    - appdata
  ports:
    - 80:80

appdata:
  image: tianon/true
  volumes:
    - /srv/www
#    - ~/.composer:/var/www/.composer
#    - ./www/app/code:/srv/www/app/code

phpfpm:
  image: mageinferno/magento2-php:7.0.5-fpm-0
  links:
    - db
  volumes_from:
    - appdata

db:
  image: mariadb:10.1.13
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
  image: mageinferno/magento2-php:7.0.5-fpm-0
  command: /usr/local/bin/mage-setup
  links:
    - db
  volumes_from:
    - appdata
  environment:
    - M2SETUP_DB_HOST=db
    - M2SETUP_DB_NAME=magento2
    - M2SETUP_DB_USER=magento2
    - M2SETUP_DB_PASSWORD=magento2
    - M2SETUP_BASE_URL=http://docker.local/
    - M2SETUP_ADMIN_FIRSTNAME=Admin
    - M2SETUP_ADMIN_LASTNAME=User
    - M2SETUP_ADMIN_EMAIL=dummy@gmail.com
    - M2SETUP_ADMIN_USER=magento2
    - M2SETUP_ADMIN_PASSWORD=magento2
    - M2SETUP_VERSION=2.0.4
    - M2SETUP_USE_SAMPLE_DATA=false
    - M2SETUP_USE_ARCHIVE=true
```

## Composer Setup

Uncomment the composer line from `appdata` to mount a `.composer` directory to the `www-data` user home directory. Please first setup Magento Marketplace authentication (details at <a href="http://devdocs.magento.com/guides/v2.0/install-gde/prereq/connect-auth.html" target="_blank">http://devdocs.magento.com/guides/v2.0/install-gde/prereq/connect-auth.html</a>).

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

Then, just set `M2SETUP_USE_ARCHIVE` to false in your docker-compose.yml file.

## Composer-less, No-Auth Setup

If you don't want to use Composer or setup the auth keys above, no worries. Mage Inferno install script uses Nexcess' hosted Magento archives for a Composer-less install process. Just set the `M2SETUP_USE_ARCHIVE` environment variable to `true` when running setup.

## Running Setup

Using the above `docker-compose.yml` file, all you need to do is run one line to install Magento 2:

```
docker-compose run --rm setup
```

You may modify any environment variables depending on your requirements.

## Data Volumes

Your Magento source data is persistently stored within Docker data volumes. For local development, we advise copying the entire contents of the `appdata` data volume to your local machine (after setup is complete of course). Since you shouldn't be modifying any of these files, this is just to bring the fully copy of the site back to your host:

```
docker cp CONTAINERID:/srv/www ./
```

Then, just uncomment the `/www/app/code:/srv/www/app/code` within your docker-compose.yml file (appdata > volumes) to mount your local `app/code` directory to the Docker data volume, then just restart your containers: 

```
docker-compose up -d app
```

This will restart your container with `app/code` mounted from your host machine, so any edits to this directory will correctly sync with your Docker volume.

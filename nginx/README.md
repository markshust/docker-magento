# Versions

- [`1.11-1` (_Dockerfile_)](https://github.com/mageinferno/docker-magento2-nginx/tree/1.11-1/Dockerfile)

# Description

This image is built from [`nginx`](https://hub.docker.com/_/nginx/) and contains the default webserver configuration for Magento 2.

# What's in this image?

This image installs the following:

- `nginx`

# Variables

The following environment variables are used for Nginx configuration:

- `PHP_HOST`: (default: `phpfpm`) The hostname of the PHP container.
- `PHP_PORT`: (default: `9000`) The port of the PHP container.
- `APP_MAGE_MODE`: (default: `default`) Set the appropriate MAGE_MODE.

# Docker Compose

Please see [https://github.com/mageinferno/magento2-docker-compose](https://github.com/mageinferno/magento2-docker-compose) for more detailed instructions and an example development environment using Docker Compose.

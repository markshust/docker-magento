#!/bin/bash

echo "Finding PHPFPM container..."

PHP_CONTAINER=$(docker ps \
  --filter "ancestor=markoshust/magento-php:8.3-fpm-4" \
  --format "{{.Names}}" | head -n1)

echo "Container found: $PHP_CONTAINER"

docker exec "$PHP_CONTAINER" bash -lc "bash compose/bin/init"

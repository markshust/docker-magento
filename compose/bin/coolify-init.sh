#!/bin/bash

set -e

echo "Waiting for MariaDB..."

until nc -z db 3306; do
  sleep 5
done

echo "Waiting for OpenSearch..."

until nc -z opensearch 9200; do
  sleep 5
done

echo "Waiting for Redis..."

until nc -z redis 6379; do
  sleep 5
done

echo "All services ready 🚀"

bash compose/bin/init

echo "Starting PHP-FPM..."

exec php-fpm

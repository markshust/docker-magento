docker-compose run --user=root --no-deps --rm -v $PWD/src/.:/src phpfpm cp -r /src/. /var/www/html

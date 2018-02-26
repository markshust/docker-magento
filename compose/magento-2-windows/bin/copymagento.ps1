docker-compose run --user=root --no-deps --rm -v $PWD/src/.:/source phpfpm cp -r /source/. /var/www/html

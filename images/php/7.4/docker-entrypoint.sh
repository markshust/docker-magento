#!/bin/bash

if [[ -n "$PHP_EXTENSIONS" ]]; then
  echo "Installing PHP extensions: $PHP_EXTENSIONS"
  sudo -E install-php-extensions "$PHP_EXTENSIONS"
fi

exec "$@"

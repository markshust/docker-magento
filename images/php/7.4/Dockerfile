FROM php:7.4-fpm-bullseye
MAINTAINER Mark Shust <mark@shust.com>

ARG APP_ID=1000
RUN groupadd -g "$APP_ID" app \
  && useradd -g "$APP_ID" -u "$APP_ID" -d /var/www -s /bin/bash app

RUN mkdir -p /etc/nginx/html /var/www/html /sock \
  && chown -R app:app /etc/nginx /var/www /usr/local/etc/php/conf.d /sock

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -

RUN apt-get update && apt-get install -y \
    cron \
    default-mysql-client \
    git \
    gnupg \
    gzip \
    lsof \
    mailutils \
    msmtp \
    nodejs \
    procps \
    vim \
    zip \
  && rm -rf /var/lib/apt/lists/*

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions \
    blackfire \
    bcmath \
    bz2 \
    calendar \
    exif \
    gd \
    gettext \
    imagick \
    intl \
    mbstring \
    mysqli \
    opcache \
    pcntl \
    pdo_mysql \
    ssh2 \
    soap \
    sockets \
    sodium \
    sysvmsg \
    sysvsem \
    sysvshm \
    redis \
    xdebug \
    xsl \
    zip

RUN curl -sS https://getcomposer.org/installer | \
  php -- --install-dir=/usr/local/bin --filename=composer

COPY conf/msmtprc /etc/msmtprc
COPY conf/php.ini $PHP_INI_DIR
COPY conf/php-fpm.conf /usr/local/etc/
COPY conf/www.conf /usr/local/etc/php-fpm.d/

USER app:app
VOLUME /var/www
WORKDIR /var/www/html

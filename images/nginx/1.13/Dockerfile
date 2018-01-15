FROM nginx:1.13
MAINTAINER Mark Shust <mark@shust.com>

RUN groupadd -g 1000 app \
 && useradd -g 1000 -u 1000 -d /var/www -s /bin/bash app

ENV PHP_HOST phpfpm
ENV PHP_PORT 9000
ENV APP_MAGE_MODE developer

COPY ./conf/nginx.conf /etc/nginx/
COPY ./conf/default.conf /etc/nginx/conf.d/
COPY ./bin/start /usr/local/bin/start

WORKDIR /var/www/html

CMD ["/usr/local/bin/start"]

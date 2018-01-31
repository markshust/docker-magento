FROM nginx:1.13
MAINTAINER Mark Shust <mark@shust.com>

RUN groupadd -g 1000 app \
 && useradd -g 1000 -u 1000 -d /var/www -s /bin/bash app
RUN touch /var/run/nginx.pid
RUN mkdir /sock
RUN chown -R app:app /var/cache/nginx/ /var/run/nginx.pid /sock

COPY ./conf/nginx.conf /etc/nginx/
COPY ./conf/default.conf /etc/nginx/conf.d/

USER app:app

VOLUME /var/www

WORKDIR /var/www/html

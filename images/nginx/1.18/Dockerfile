FROM nginx:1.18-alpine
MAINTAINER Mark Shust <mark@shust.com>

ARG APP_ID=1000

# Install necessary tools
RUN addgroup -g "$APP_ID" app \
 && adduser -G app -u "$APP_ID" -h /var/www -s /bin/bash -S app \
 && apk add --no-cache curl nss-tools

# Install mkcert
ARG TARGETARCH
RUN curl -L https://github.com/FiloSottile/mkcert/releases/download/v1.4.3/mkcert-v1.4.3-linux-$TARGETARCH -o /usr/local/bin/mkcert \
 && chmod +x /usr/local/bin/mkcert

# Generate SSL certificate and key using mkcert
RUN mkcert -key-file /etc/nginx/certs/nginx.key -cert-file /etc/nginx/certs/nginx.crt localhost 127.0.0.1 ::1

# Copy NGINX configuration files
COPY ./conf/nginx.conf /etc/nginx/
COPY ./conf/default.conf /etc/nginx/conf.d/

# Create directories and set permissions
RUN mkdir -p /etc/nginx/html /var/www/html \
  && chown -R app:app /etc/nginx /var/www /var/cache/nginx /var/run/nginx.pid /sock

EXPOSE 8443

USER app:app

VOLUME /var/www

WORKDIR /var/www/html

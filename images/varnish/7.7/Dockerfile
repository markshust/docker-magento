FROM varnish:7.7-alpine

## Default cache size. Override with the VARNISH_SIZE env var.
ENV VARNISH_SIZE=256m

COPY ./conf/default.vcl /etc/varnish/default.vcl

EXPOSE 80

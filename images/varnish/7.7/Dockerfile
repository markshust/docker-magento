FROM varnish:7.7-alpine
LABEL maintainer="Mark Shust <mark@shust.com>"

## Default cache size. Override with the VARNISH_SIZE env var.
ENV VARNISH_SIZE=256m

## The Magento VCL is not baked in. It is volume-mounted from the project's
## template/varnish/default.vcl (see compose.yaml) so it can be customized.

EXPOSE 80

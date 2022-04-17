# desired Caddy version
ARG CADDY_VERSION

if [ -z "$CADDY_VERSION" ]; then echo >&2 "error: build argument 'CADDY_VERSION' is required" && exit 1; fi

###########
# builder #
FROM caddy:${CADDY_VERSION}-builder-alpine AS builder
ARG CADDY_VERSION
RUN xcaddy build v${CADDY_VERSION} \
  --with github.com/caddy-dns/cloudflare

#########
# image #
FROM caddy:${CADDY_VERSION}-alpine
COPY --from=builder /usr/bin/caddy /usr/bin/caddy

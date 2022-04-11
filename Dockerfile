# desired Caddy version
ARG CADDY_VERSION

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

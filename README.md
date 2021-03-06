# caddy

[Caddyserver](https://github.com/caddyserver/caddy/) with the following modules included:

* [Cloudflare DNS ACME DNS-01 challenge](https://github.com/caddy-dns/cloudflare)

built for AMD64, ARM64 & ARMv7

Also a few custom environment variables.

![Image Version][shieldversion] ![Image Size][shieldsize]

[![Image Docker Hub Registry](https://img.shields.io/static/v1.svg?color=blue&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=saltiresoul&message=Docker%20Registry&logo=docker)](https://hub.docker.com/r/saltiresoul/caddy-cf) [![Image GitHub Registry](https://img.shields.io/static/v1.svg?color=blueviolet&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=saltiresoul&message=GitHub%20Package&logo=github)](https://github.com/SaltireSoul/caddy-cf/pkgs/container/caddy-cf)

[shieldsize]: https://img.shields.io/docker/image-size/saltiresoul/caddy-cf/latest?style=for-the-badge
[shieldversion]: https://img.shields.io/docker/v/saltiresoul/caddy-cf?style=for-the-badge

```bash
docker run -it --name caddy \
  -p 80:80 \
  -p 443:443 \
  -v $PWD/caddy_data:/data \
  -v $PWD/caddy_config:/config \
  -v $PWD/Caddyfile:/etc/caddy/Caddyfile \
  -v $PWD/site:/srv \
  -e CLOUDFLARE_EMAIL=me@example.com \
  -e CLOUDFLARE_API_TOKEN=12345 \
  -e ACME_AGREE=true \
  ghcr.io/saltiresoul/caddy-cf:latest
```

#### Graceful reloads

Caddy does not require a full restart when configuration is changed. Caddy comes with a [caddy reload](https://caddyserver.com/docs/command-line#caddy-reload) command which can be used to reload its configuration with zero downtime.

```bash
caddy_container_id=$(docker ps | grep caddy | awk '{print $1;}')
docker exec -w /etc/caddy $caddy_container_id caddy reload
```
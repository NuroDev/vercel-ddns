# ☁️ Vercel DDNS

vercel-ddns is a simple command line tool for creating a DNS record for Vercel's Managed DNS service.

[![Version](https://img.shields.io/github/v/release/nurodev/vercel-ddns?label=%20&style=for-the-badge)](https://github.com/NuroDev/vercel-ddns/releases)
[![Build](https://img.shields.io/github/workflow/status/nurodev/vercel-ddns/Build?label=%20&logo=github&logoColor=white&style=for-the-badge)](https://github.com/NuroDev/vercel-ddns/actions?query=workflow%3Abuild)

## 🦄 Usage

### CLI

```zsh
vercel-ddns 0.1.0


USAGE:
    vercel-ddns [OPTIONS] --domain <domain> --subdomain <subdomain> --token <token>

FLAGS:
    -h, --help       Prints help information
    -V, --version    Prints version information

OPTIONS:
    -d, --domain <domain>           [env: VDDNS_DOMAIN=]
    -i, --ip-type <ip-type>         [env: VDDNS_IP_TYPE=]  [default: ipv4]  [possible values: IPV4,
                                   IPV6]
    -s, --subdomain <subdomain>     [env: VDDNS_SUBDOMAIN=]
    -t, --token <token>             [env: VERCEL_TOKEN=]
        --ttl <ttl>                 [env: VDDNS_TTL=]  [default: 3600]
```

### 🐳 Docker CLI

```zsh
docker run -d \
    -e VERCEL_TOKEN=<YOUR_TOKEN> \
    -e VDDNS_DOMAIN=<example.com> \
    -e VDDNS_SUBDOMAIN=<sample> \
    -e VDDNS_TTL=3600 `#optional` \
    -e VDDNS_IP_TYPE=ipv4 `#optional` \
    -e CRON_SCHEDULE="*/15 * * * *" `#optional` \
    ghcr.io/nurodev/vercel-ddns:cron
```

### 🐳 Docker Compose

```yml
version: "3.7"

services:
  ddns:
    image: ghcr.io/nurodev/vercel-ddns:cron
    container_name: vercel-ddns
    restart: unless-stopped
    environment:
      - VERCEL_TOKEN=<YOUR_TOKEN>
      - VDDNS_DOMAIN=<example.com>
      - VDDNS_SUBDOMAIN=<sample>
      - VDDNS_TTL=3600 #optional
      - VDDNS_IP_TYPE=ipv4 #optional
      - CRON_SCHEDULE="*/15 * * * *" #optional
```

## ❤️ Credits

- [KROSF/vercel-ddns](https://github.com/KROSF/vercel-ddns) for the original project
- [lukehsiao/netlify-ddns-rs](https://github.com/lukehsiao/netlify-ddns-rs) for a similar
  client for Netlify.

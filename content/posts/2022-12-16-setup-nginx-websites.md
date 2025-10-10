---
layout: post
title: 
subtitle: 
date: 2022-12-16
author: ChaosNyaruko
header-img: 
catalog: true
tags:
    - website
    - tls
    - nginx 
    - firewall
---
## Get Server
A basic VPS is enough for personal usage.

## Nginx Setup

```
apt install nginx
```
main directories and files:
- /etc/nginx/sites-available
- /etc/nginx/sites-enabled(typically symbolic links for "available")
- /etc/nginx/nginx.conf
- /var/log/nginx/access.log
- /var/log/nginx/error.log

## Get HTTPS Cert Support
Using HTTPS should be modern and more secure.

> https://snapcraft.io/docs/installing-snap-on-debian

> https://certbot.eff.org/instructions?ws=nginx&os=debianbuster

We use **certbot** to get https support for your website, and renew automatically.

Debian10/11 operation example:
```bash
apt install snapd
snap install core
snap install hello-world
snap refresh core
snap install --classic certbot
ln -s /snap/bin/certbot /usr/bin/certbot
certbot --nginx / certbot certonly --nginx
certbot renew --dry-run
```
The job should be in:
- /etc/crontab/
- /etc/cron.*/*
- systemctl list-timers

## Firewall Setup
If you still can't access your index.html from outside, maybe your firewall needs further setup.
```bash
ufw status
ufw allow 'Nginx HTTP'
ufw allow 'Nginx HTTPS'
```
> https://www.digitalocean.com/community/tutorials/nginx-ssl-certificate-https-redirect-errors

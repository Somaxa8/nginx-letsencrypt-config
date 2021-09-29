#!/usr/bin/env bash

docker rm -f nginx

docker run --name nginx --restart always --network somacode -d -p 80:80 -p 443:443 --hostname api-books.somacode.app -e LETS_ENCRYPT_DOMAINS=books.somacode.app -v /root/nginx/config:/etc/nginx/conf.d -v letsencrypt:/etc/letsencrypt -v /root/nginx/html:/usr/share/nginx/html:ro -e LETS_ENCRYPT_EMAIL=silviofrancoxa8@gmail.com nginx-certbot


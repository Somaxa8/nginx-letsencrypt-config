#!/usr/bin/env bash

service cron start

if [ ! -e /etc/letsencrypt/live/$(hostname -f)/privkey.pem ]; then
	echo "No certificate found for $(hostname -f)"

	if [ -n "$LETS_ENCRYPT_DOMAINS" ]; then
		LETS_ENCRYPT_DOMAINS=${LETS_ENCRYPT_DOMAINS//,/ --domains }
		LETS_ENCRYPT_DOMAINS="--domains $LETS_ENCRYPT_DOMAINS"
	fi

	certbot certonly --nginx --non-interactive --no-self-upgrade --agree-tos --email $LETS_ENCRYPT_EMAIL --domain $(hostname -f) $LETS_ENCRYPT_DOMAINS
else
	echo "Certificate found for $(hostname -f)"
	certbot renew --no-self-upgrade
fi

nginx -g "daemon off;"


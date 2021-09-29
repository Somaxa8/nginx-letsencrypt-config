FROM nginx

RUN apt-get -y update
RUN apt-get -y install certbot python-certbot-nginx cron

RUN crontab /etc/cron.d/certbot

COPY launcher.sh /usr/local/bin/launcher.sh
RUN chmod +x /usr/local/bin/launcher.sh

CMD ["/usr/local/bin/launcher.sh"]


# vim:set ft=dockerfile:
FROM debian:wheezy

# declare that you're extending this image

MAINTAINER SIMON Allan <simona@gobeta.com.cn>

RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*

RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

COPY vhost.conf /etc/nginx/sites-enabled/default
COPY entrypoint.sh /root/entrypoint.sh
RUN chown root:root /root/entrypoint.sh 
RUN chmod +x /root/entrypoint.sh

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["/root/entrypoint.sh"]

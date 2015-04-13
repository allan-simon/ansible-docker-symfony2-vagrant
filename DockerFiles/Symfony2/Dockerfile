# vim:set ft=dockerfile:
FROM debian:wheezy

# declare that you're extending this image

MAINTAINER SIMON Allan <simona@gobeta.com.cn>

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E9C74FEEA2098A6E && \
    echo "deb http://packages.dotdeb.org/ wheezy-php55 all" > /etc/apt/sources.list.d/php.list && \
    echo "deb http://ftp.debian.org/debian wheezy-backports main contrib non-free" >> /etc/apt/sources.list.d/php.list && \
    apt-get update && \
    apt-get install -y \
        curl \
        git \
        nginx \
        php5-fpm \
        php5-cli \
        php5-xdebug \
        php5-imagick \
        php5-gd \
        php5-mongo \
        php5-curl \
        php5-mcrypt \
        php5-intl \
        php5-mysql \
        php5-sqlite \
        php5-redis \
        php5-pgsql \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

COPY config/vhost.conf /etc/nginx/sites-enabled/default

COPY config/php-extra.ini /etc/php5/mods-available/extra.ini
RUN php5enmod extra

COPY entrypoint.sh /root/entrypoint.sh
RUN chown root:root /root/entrypoint.sh 
RUN chmod +x /root/entrypoint.sh

VOLUME ["/var/www", "/var/log/nginx/"]

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["/root/entrypoint.sh"]

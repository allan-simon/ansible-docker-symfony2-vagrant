#!/bin/bash

if [ $DEBUG ]; then
    echo "xdebug.remote_connect_back=On" >> /etc/php5/fpm/conf.d/20-xdebug.ini
    echo "xdebug.remote_enable=On" >> /etc/php5/fpm/conf.d/20-xdebug.ini
fi

cd /var/www

if [ -z "$1" ];
    then

    sed -i "s@listen = /var/run/php5-fpm.sock@listen = 9000@" /etc/php5/fpm/pool.d/www.conf
    exec /usr/sbin/php5-fpm --nodaemonize

else
    exec "$@"
fi

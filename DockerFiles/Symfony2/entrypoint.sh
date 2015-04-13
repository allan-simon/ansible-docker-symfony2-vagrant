#!/bin/bash

if [ $DEBUG ]; then
    echo "xdebug.remote_connect_back=On" >> /etc/php5/fpm/conf.d/20-xdebug.ini
    echo "xdebug.remote_enable=On" >> /etc/php5/fpm/conf.d/20-xdebug.ini
fi

cd /var/www

if [ -z "$1" ];
    then

    # if you're in china and that for some reason
    # the docker build has failed to download composer.phar...
    if ! which composer; then
        curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
    fi
    # variable provided by ansible when launching the docker container
    mkdir ~/.composer
    cat > ~/.composer/config.json <<EOS
{
    "config": {
        "github-oauth": { "github.com": "$GITHUB_TOKEN" }
    }
}
EOS
    # we make sure to start fresh
    rm app/config/parameters.yml
    composer install
    rm -rf app/cache/*
    php app/console assets:install --symlink web/
    php app/console c:c
    php app/console c:w
    # not pretty ...
    chmod -R 777 app/logs
    chmod -R 777 app/cache

    service php5-fpm restart
    nginx
else
    exec "$@"
fi

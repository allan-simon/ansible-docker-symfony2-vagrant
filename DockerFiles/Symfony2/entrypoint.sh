#!/bin/bash

cd /var/www

if [ -z "$1" ];
    then

    # if you're in china and that for some reason
    # the docker build has failed to download composer.phar...
    if ! which composer; then
        if [ -f composer.phar ]; then
            cp composer.phar /usr/local/bin/composer
            chmod +x /usr/local/bin/composer
        else 
            curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
        fi
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
    composer install --no-interaction
    rm -rf app/cache/*
    php app/console assets:install --symlink web/
    php app/console c:c
    php app/console c:w
    php app/console doctrine:migrations:migrate --no-interaction
    # not pretty ...
    chmod -R 777 app/logs
    chmod -R 777 app/cache

else
    exec "$@"
fi

#!/bin/bash

if [ -z "$1" ]; then
    /bin/sed -i "s@<BLUE_ADDR>@${BLUE_PORT_80_TCP_ADDR}@" /etc/nginx/sites-enabled/default
    /bin/sed -i "s@<BLUE_PORT>@${BLUE_PORT_80_TCP_PORT}@" /etc/nginx/sites-enabled/default

    /bin/sed -i "s@<GREEN_ADDR>@${GREEN_PORT_80_TCP_ADDR}@" /etc/nginx/sites-enabled/default
    /bin/sed -i "s@<GREEN_PORT>@${GREEN_PORT_80_TCP_PORT}@" /etc/nginx/sites-enabled/default
    echo "set \$activeBackend ${SERVER_COLOR};" > /etc/nginx/backend.conf
    nginx
else
    exec "$@"
fi

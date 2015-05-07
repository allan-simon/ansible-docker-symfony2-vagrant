#!/bin/bash

if [ -z "$1" ]; then
    /bin/sed -i "s@<FPM_PORT>@${FPM_PORT_9000_TCP_PORT}@" /etc/nginx/sites-enabled/default
    nginx
else
    exec "$@"
fi

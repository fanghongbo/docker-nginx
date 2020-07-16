#!/bin/bash

set -e
if [ "${1#-}" == '' ]; then
    set -- /usr/local/nginx/sbin/nginx
fi
exec "$@"


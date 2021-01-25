#!/usr/bin/env sh
set -eu
envsubst '${NGINX_HOST_NAME} ${NGINX_PORT} ${BACKEND_HOSTNAME} ${BACKEND_PORT}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf
exec "$@"

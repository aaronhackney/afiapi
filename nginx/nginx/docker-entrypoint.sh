#!/usr/bin/env sh
set -eu
envsubst '${NGINX_HOST_NAME} ${NGINX_PORT} ${BACKEND_HOSTNAME} ${BACKEND_PORT} ${TLS_CERT_FILE} ${TLS_KEY_FILE}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf
exec "$@"

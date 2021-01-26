FROM nginx

# Make the --build-arg vaules available to the build system
ARG NGINX_HOST_NAME
ARG NGINX_PORT
ARG BACKEND_HOSTNAME
ARG BACKEND_PORT
ARG TLS_CERT_FILE
ARG TLS_KEY_FILE

# Set the environment variables in the containter
ENV NGINX_HOST_NAME $NGINX_HOST_NAME
ENV NGINX_PORT $NGINX_PORT
ENV BACKEND_HOSTNAME $BACKEND_HOSTNAME
ENV BACKEND_PORT $BACKEND_PORT
ENV TLS_CERT_FILE $TLS_CERT_FILE
ENV TLS_KEY_FILE $TLS_KEY_FILE

# Copy the nginx config file to the container
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf.template

# Copy the nginx configuration script to the container and make it executable
COPY ./nginx/docker-entrypoint.sh /
RUN ["chmod", "+x", "/docker-entrypoint.sh"]

# Run the nginx configuration script
ENTRYPOINT ["/docker-entrypoint.sh"]

# start the nginx daemon
CMD ["nginx", "-g", "daemon off;"]

FROM python:3.9
RUN mkdir -p /afiapi
RUN mkdir -p /afiapi/log
COPY . /afiapi
WORKDIR /afiapi/afiapi
RUN pip3 install -r /afiapi/requirements.txt
EXPOSE 8080
CMD ["gunicorn", "-w", "3", "-b", "0.0.0.0:8080", "--access-logfile", "/afiapi/log/access", "--error-logfile", \
    "/afiapi/log/error", "wsgi:app"]


# --build-arg /etc/letsencrypt/live/afi.hacksbrain.com/fullchain.pem (TLS certificate file on the build machine)
# --build-arg /etc/letsencrypt/live/afi.hacksbrain.com/privkey.pem (TLS key file on the build machine)
# --build-arg afi.hacksbrain.com (the hostname of the nginx listening server)
# --build-arg 8443 (\the listening port of the nginx listening server)
# --build-arg afiapi (the hostname or ip of the backend flask server - could be a docker container --name)
# --build-arg 8080 (the listening port of the backend flask server)
FROM nginx

# Set the environment variables in the containter
ENV NGINX_HOST_NAME NGINX_HOST_NAME
ENV NGINX_PORT NGINX_PORT
ENV BACKEND_HOSTNAME BACKEND_HOSTNAME
ENV BACKEND_PORT BACKEND_PORT

# Copy the TLS certificate and key to the container
RUN mkdir -p /etc/certs
COPY TLS_CERT_FILE /etc/certs/cert.pem
COPY TLS_KEY_FILE /etc/certs/key.pem

# Copy the nginx config file to the container
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf.template

# Copy the nginx configuration script to the container 
COPY ./nginx/docker-entrypoint.sh /

# Run the nginx configuration script
ENTRYPOINT ["/docker-entrypoint.sh"]

# start the nginx container
CMD ["nginx", "-g", "daemon off;"]

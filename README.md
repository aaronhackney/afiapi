# afiapi

This project was really just a chance for me to orchestrate the deployment of a small microservice and nginx.   
Simply set your custom values for the variables in .env and build/run the containers  

The pre-requisites are:  
- Docker and Docker-Compose should be installed on the host machine
- A docker network to allow the nginx container and the Flask/API container to communicate with one another
- A TLS (SSL) certificate and private key to serve the API over TLS

## Configurable Variables
In the file .env please configure the following to your liking  
`TLS_CERT_PATH=/etc/letsencrypt/live/afi.hacksbrain.com-0001` - The directory where your certificate is stored
`TLS_CERT_ARCHIVE_PATH=/etc/letsencrypt/archive/afi.hacksbrain.com-0001` - If you are using certbot, include the certificate archive directory   
`TLS_CERT_FILE=fullchain.pem` - The name of the TLS certificate file. Your file will need to include any needed intermediate certificates
`TLS_KEY_FILE=privkey.pem` - The private key for your TLS certificate pair  
`NGINX_HOST_NAME=afi.hacksbrain.com` - The hostname or ip address that your host machine will use to pass traffic to the nginx docker container  
`NGINX_PORT=8443` - The "front end" port that nginx will listen on for client connections
`BACKEND_HOSTNAME=afiapi` - The docker container name to use for the flask/api container
`BACKEND_PORT=8080` - The port that the flask/api container on which to listen for connections from nginx  
`DOCKER_NET=MORTY-NET` - This is the name of an existing network on the host docker system  
`IMAGE_NAME=afiapi` The name of the flask/api container (TODO This is a repeat of BACKEND_HOSTNAME)  
`IMAGE_VERSION=1.0.2` The version of your container deployment. Not critical  
`REGISTRY=docker.hacksbrain.com:5005` The hostname and port your registry server listens on  

## Build the containers
`docker-compose build`

## Run the services
`docker-compose up -d`


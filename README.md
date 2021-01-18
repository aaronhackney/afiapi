# afiapi

Start the uWSGI server:  
    uwsgi --ini afiapi.ini

Start the nginx server:
    brew services start nginx (mac osx)

(http) --> nginx --> (WSGI via Unix Socket) --> uWSGI --> Python

nginx config: /usr/local/etc/nginx/servers/afi.conf

server {
    listen 8080;
    server_name afi.hacksbrain.com;

    location / {
        include uwsgi_params;
        uwsgi_pass unix:/Users/aaron.hackney/Projects/afiapi/afiapi/afi.sock;
    }
}

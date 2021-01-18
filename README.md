# afiapi

Start the gunicorn server:  
    gunicorn --workers 3 --bind unix:/usr/local/var/run/afi.sock -m 007 wsgi:app

Start the nginx server:
    brew services start nginx (mac osx)

(http) --> nginx --> (WSGI via Unix Socket) --> gunicorn --> Python

nginx config: /usr/local/etc/nginx/servers/afi.conf

```
server {
    listen 8080 default_server;
    server_name afi.hacksbrain.com;

    location = / {
        return 301 $scheme://$host:$server_port/api/v1/resources/all;
    }

    location /api/v1/resources/all {
        include proxy_params;
        proxy_pass http://unix:/usr/local/var/run/afi.sock;
    }
}
```
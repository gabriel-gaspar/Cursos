# Sections 8 and 9 - Building multi-container applications and dockerizing them 

In this section, we will learn how to set up a multi-container development environment using docker-compose.
The process consists of the following steps:
- create a Dockerfile.dev within each project folder
- build the image for each project
- create a docker-compose.yml file do deploy the containers
- create a nginx server to proxy incoming requests based on route params.

The most important thing here is to understand the very last step, that is the nginx server. <br/>
The nginx server will proxy incoming requests based on route params. For instance, if the developer enters an URL ending with /api/values/current, so the request will be redirected to the backend. If the URL ends with "/", it will be redirected to the frontend application.

In the host machine, the nginx server knows exactly on which port each service is listening to (we configure this through rules written in a default.conf file).

Why should we do that? Because otherwise the developer would have to know the ports of each service, furthermore, it would have to be hardcoded in the source code of the application which would be terribly bad, once ports are very volatile resources.

It is also good practice to remove the '/api/" from the request forwarded by the nginx server, once its only intent is for routing.

A nginx default.conf file would be as follows:

**default.conf**
```YML

# Declare an upstream server, named client
upstream client{
    # the upstream has a server running on the URL: client:3000
    # in this url, "client" is the name given to the service in the docker-compose file.
    server client:3000;
}

# Declare an upstream server, named server
upstream server{
    # the upstream has a server running on the URL: server:3000
    # in this url, "server" is the name given to the service in the docker-compose file.
    server server:5000;
}

# Configure the nginx server
server {

    # It will listen on the port 80 of the host machine
    listen 80;

    # First routing rule
    # If the request path is "/"
    location / {
        # Redirect it to the URL below.
        # "client" is one of the upstream services create above.
        proxy_pass http://client;
    }

    # Second routing rule
    # If the request path is "/api"
    location /api {
        # Chops the incoming request path so that the forwarded request does not contains the "/api" prefix.
        rewrite /api/(.*) /$1 break;
        # Redirect it to the URL below.
        # "server" is one of the upstream services create above
        proxy_pass http://server;
    }

    #  Allow websocket connections
    # For this class, the front-end application needs websocket connections with the backend.
    # So, as the nginx is in the way, it has to allow such connections through it.
    location /sockjs-node {
        proxy_pass http://client;
        proxy_http_version 1.1;
        pxoy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "Upgrade";
    }
}

```
        
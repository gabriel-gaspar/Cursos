# **Section 5 - Docker compose with multiple local containers**

A **docker-compose** file is the best way of managing multiple containers in a local machine. Until now, you have been working with containers using the CLI, which is the **imperative** way of dealing with docker.

**docker-compose** offers a **declarative** way of managing container infrastructure. You just specify what you want to do and the Docker Server will do all the work to deploy it.

Example:

**docker-compose.yml**
```YML
# Docker-compose version
version: '3'

# Begin services array
services:

    # Name of the first service
    redis-server:
        # Name of the image that is going to be used to create containers for this service
        image: 'redis'

    # Name of the second service
    node-app:
        # In this case, the image is going to be built from a dockerfile
        # The dockerfile is located at the actual directory - "."
        build: .
        # The container will be deployed with the following port mapping
        ports:
          - "8081:8081"
        # No matter the reason, the container will be restarted as soon as it gets stopped 
        restart: always
```

### Important notes about some fields:

```YML
restart: always
```
There are other options for this field. Lets check each one of them:

- **always**
    - as already stated, the container will be restarted as soon as it gets stopped, no matter the reason.
- **no**
    - the container will never be restarted. If it gets stopped, it will remain as such.
- **on-failure**
    -  every process returns an integer when it gets to an end.
    -  if the returned value is 0, so the end has been caused on purpose.
    -  else, the end has been caused due to an error.
    -  for this policy, if a container terminates with an exit code other than zero, then it is going to be restarted. 
- **unless-stopped**
    - the container will always be restarted, unless it has been stopped by command line.

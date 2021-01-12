# **Section 6 - Creating a production grade workflow**

In a professional workflow, there usually exist two dockerfiles, one for development purposes and the other for production ones.
Why? Because, in general, when an application is being developed, everything happens inside a development environment. This environment allows the developer to make code changes, test them, and see their effects in real-time. So, no build process is needed to check if the changes have worked well or not.

<hr />

## **Development**

<hr/>

To start a development environment in a Nodejs application, one should run the following command:
```
>> npm run start
```

In the code block bellow, you can see an example of a dockerfile that can be used to start a development environment.

**Dockerfile.dev**
```Dockerfile
FROM node:alpine

WORKDIR /usr/app

COPY ./package.json ./
RUN npm install

COPY ./ ./

CMD ["npm","run","start"]

```

**WARNING !!** 

With the dockerfile above, one can build an image and create a container with a development environment running in its inside.

The problem is the following: the container's filesystem was created and filled with all application files in the state they were at the exact moment in which the build command was executed.

Once the container is running, you may want to make changes in the code and see its effects on the application. The only problem is that the files you are changing now are not the same as those that have been placed inside the container (during the build process).

Docker provides a way of mounting a filesystem of your local machine into the container. That way, every change in the files inside the container will be reflected outside of it and vice-versa. This feature is called **Docker Volumes**.

In the code block below, you can see an example of it.

**docker-compose.yml**
```YML
# Docker-compose version
version: '3'

# Begin services array
services:
    web:
        build: 
            context: .
            dockerfile: ./Dockerfile.dev
        ports: "3000:3000"
        volumes:
          - /app/node_modules
          - .:./app

```

Two volumes are being declared for the container.

```YML
    - /app/node_modules
    - .:./app
```
 
The second one is exactly what we have discussed in the previous paragraph. The current path (or context) is being mounted inside the container (in the path ./app, to be precise). So, the content in the context must match exactly the content inside the container. Therefore, files inside the container that does not exist in the context will be deleted, **unless they are bookmarked**, which is exactly what the first volume declaration does! 

During the build process, dependencies have been installed in the image file system. For a Nodejs application, these dependencies are stored in a folder called node_modules. When you deploy a container using the image and mount your local file system inside the container, the docker server will notice that there is a folder called node_modules inside the container that does not match any folder in the context! To avoid it from being deleted, we transform it into a volume for the container.

<hr />

## **Testing**

<hr/>

After the changes have been made, it is time to test the app!. <br/>
There are three different approaches to this situation, each one with its pros and cons.

<br/>

**First:**: 

If you have an image with an application installed within it and you just want to check if the tests are all passing with no failures, so you can just run the command:

```
>> docker run -it imageName npm run test
```
With this approach, you won't be able to modify the application code, neither the tests suite.

<br/>

**Second**:

If you have a docker-compose file like the one presented in the Development section of this README, you can first deploy the container in your machine and run the docker exec command to start the tests suit..

```
>> docker-compose up
>> docker exec -it containerID npm run test
```

This approach is pretty handy. The downside of it is that you will have to type the command docker exec whenever you want to run the tests.

<br/>

**Third**:

With this approach, the idea is to create a new service in the docker-compose file responsible for testing the app. It would look like as presented below:

```YML
    tests:
        build:
            context: .
            dockerfile: ./Dockerfile.dev
        volumes:
            - /app/node_modules
            - .:./app  
        command: ["npm","run","test"] 
```

Now, you can just run docker-compose up to run the tests.
There is only one downside to this approach: if the testing framework has some interactive menu to allow the dev to customize the tests suite, it will not be possible to interact with it. The reason is that the process responsible for listening to these inputs (the testing framework) is not the main process running inside the container (which is the npm process), so it is not possible to attach or to execute commands via CLI in a process other than the one which corresponds to the PID 0.
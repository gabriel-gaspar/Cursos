# **Section 4 - Making real projects with Docker**

## **Lessons 38 - 49**

A basic Dockerfile used to run Nodejs applications would be as follows:

```Dockerfile
FROM node:alpine

WORKDIR /usr/app 

COPY ./ ./

RUN npm install

CMD ["npm","start"]
```

### Important Notes:


Some frameworks need additional files to build applications. For instance, to set up and run a Nodejs application, two commands are required:
  
```
>> npm install
>> npm start
```
    
The first command will install all the dependencies required by the application. Those dependencies are specified in a file called **package.json**.

Thus, if you have to run **npm install** from inside the container, you must first send the package.json file from your local machine to within it.

That is what the COPY instruction is for.

```Dockerfile
COPY ./ ./
```

It will move all files from the context (the directory where the Dockerfile is located) to inside the container.

You can also specify what files you want to copy.

**Attention!**

It is not best practice moving application files to the root directory of the container's file system. You may end up causing conflicts with the files and folders of the system.

To prevent this, you can specify a path to a working directory inside the container. That way, "./" will refer to this path, and all files will be placed there. 

```Dockerfile
WORKDIR /usr/app
```

## **Lesson 50**

There is a performance issue with the dockerfile presented before.
The process of installing dependencies usually takes a lot of time. If you take a closer look at the following lines:

``` Dockerfile
COPY ./ ./
RUN npm install
```

You may notice that if one makes a little change to the source code of the application, the Docker Server, before starting to execute the command COPY, will realize that some files were changed, then, it will trigger the re-execution of this line and every other that follows. So, even though there were no changes in the dependencies, the process will repeat.

To make the proccess more efficient, it is best practice to install the dependencies first.

A better version of the dockerfile would be as presented bellow.

```Dockerfile
FROM node:alpine

WORKDIR /usr/app 

# Install dependencies
COPY ./package.json ./
RUN npm install

# Copy everything else
COPY ./ ./

CMD ["npm","start"]
```
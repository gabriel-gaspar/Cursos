# Section 10 - A continuous integration workflow for multiple images

The workflow consists of the following steps:
- Push code to github
- Travis automatically pulls the repository
- Travis builds a test image and tests the code
- Once the tests have successfuly passed, Travis builds prod images
- Travis pushes the prod images to the Docker Hub
- Travis pushes a notification to Elastic Beanstalk
- Elastic Beanstalk pulls the images from Docker Hub and deploys them.

The first step is to create a prod version of the dockerfile for each project.

Even though some dockerfiles end up being the same, it is best practice to have two versions of it anyway, one for development purposes and another for production.

In the client (frontend) application, there is an important note to take into consideration. In the development environment, the frontend was a React Server that established a websocket connection with client browsers to refresh them automatically when changes were made in code. On the other hand, in a production environment, the React application is only a bunch of static files to be served by a Webserver. In this case, the webserver is going to be another nginx server which will have a slightly different configuration than the one we have configured to proxy requests between backends.


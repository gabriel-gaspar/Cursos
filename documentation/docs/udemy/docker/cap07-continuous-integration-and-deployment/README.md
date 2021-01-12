# **Section 7 - Continuous integration and deployment**

A continuous integration pipeline with Travis CI starts when the user creates a pull-request to a master branch. When this situation occurs, Travis CI pulls all the code and starts the testing routines.

The testing results are placed in the code-review section of the pull-request page, along with code reviews provided by team members. After this process is completed, one can perform a merge of the pull-request into the master branch, which, in turn will, trigger a continuous deployment pipeline.

How does Travis CI know how to test the application?
The repository must have a file called **.travis.yml**, as showned below.

**.travis.yml**
```YML
# root privileges is required in all commands that are going to be executed throghout the pipeline!
sudo: required

# Specify software that has to be present in the runtime created by Travis.
services:
  - docker

# commands that must be executed to prepare the environment for whatever we want to do.
# As we want to run testing routines that are encapsulated inside a container, we need a container up and running in the first place!
# The container must be create from the Dockerfile.dev file. Why? 
# Because the container created from this file contains all dependencies required by the application, including the testing framework.
before_install:
  - docker build -t  gabriel-gaspar/react_app -f Dockerfile.dev

# Travis assumes the testing routine ends with a status code 0.
# This behavior does not occur in Jest (Nodejs testing framework)
# After the end of the first execution, the process hangs in an
# interactive menu. So, to disable this menu, one as to pass the option
# -e CI=true when executing the run command.
script:
- docker run -e CI=true gabriel-gaspar/docker-react npm run test

# Travis can integrate with different cloud providers.
# In this case, we are going to deploy the app on AWS Elastic Beanstalk.
# For this, you have to the following:
# - access the AWS Console, 
# - choose a Region, 
# - create an Elastic Beanstalk Application
#   - Set Docker running on 64bit Amazon Linux as Platform.
#   - Set EC2 as t2.small.
# - create an Environment for the Application.
deploy:
  # Name of the platform in which the app will be deployed.
  provider: elasticbeanstalk
  #  Region choosed when creating the Application
  region: "us-west-2"
  # Application name
  app: "docker"
  # Environment Name
  env: "Docker-env"
  # Elastic Beanstalk creates a bucket in the S3 Bucket Service to store data about Applications created in each Region.
  # You have to find out the name of the bucket created for the Region you have selected.
  bucket_name: "elasticbeanstalk-us-west-2-342525436456"
  # The name of the folder created for your Application, inside the bucket.
  # In general, it has the same name as your Applicaiton.
  bucket_path: "docker"
  # Specify what branch will trigger the deployment process.
  on:
    branch: main

  # Travis CI needs IAM credentials to acces you AWS account.
  # So, you have to create an IAM User for it, attach permissions to fully access the Elastic Beanstalk Service, and generate the credentials.
  # For this user, make sure you don't allow access through the management console. Only programmatic access is needed.
  # Once you have the credentials, access the Travis CI console and insert them as runtime environment variables.
  access_key_id: $AWS_ACCESS_KEY
  secret_access_key: $AWS_SECRET_KEY
```
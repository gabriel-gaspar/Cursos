# **Getting started with mkdocs and material**

In order to set up a development environment, follow the steps below.

### **Step 1. Download de docker image**

```
>> docker pull squidfunk/mkdocs-material
```

### **Step 2. Create a folder to host your project**

### **Step 3. Start an empty project**

```
docker run --rm -it -v ${PWD}:/docs squidfunk/mkdocs-material new .
```

### **Step 4. Create a docker-compose.yml file to declare the development server container**

```YML
version: '3'

services:
  documentation.dev:
    image: squidfunk/mkdocs-material
    ports: 
      - '8000:8000'
    volumes:
      - ./mydoc:/docs
```

### **Step 5. Deploy the development serve**r

```
>> docker-compose up
```

### **Step 6. Access the development server in the url http://localhost:8000**

### **Step 7. Enjoy creating your Doc!**     

### **Step 8. Once you have finished your Doc, build the static files.**

```
>> mkdocs build
```

# Java Sprint Boot application on Container
This repo includes a simple spring boot java application using WebSocket, which is based on a quickstart from spring.io.

Follow along the steps to build, package and run the Java application on a container.

1. Build and Package the Java application

This simple Java application is an interactive web application using WebSocket (thin & lightweight layer above TCP), which enables a bi-directional communication between a client and a server, and based on traditional client-server model. The spring boot application project can be bootstrapped with Spring Initializr (https://start.spring.io/), with the required dependency of WebSocket libraries. Please continue with the next steps from reference link below [1].  

2. Create Dockerfile

This implementation uses a multi-stage build with Docker, in which the first stage is used to build and package the application code (.jar) and second state will only include the previously built application code (.jar) and a JRE to run it. This approach helps in keeping the final image size relatively smaller and only include the required runtime artefact.

The base images used with multi-stage builds are **maven:3.8-openjdk-11-slim** (includes maven:3.8 + openjdk11) and **openjdk:11-jre-slim** (includes JRE runtime), both are lightweight images from Dockerhub container registry

3. Build the container image

Place the Dockerfile in the root directory of the project and build the container image with below command:
```
docker build -t greeting:1.0 .
```
Note: please do not forget “ . ” in the end, which set the current directory for Dockerfile. 

4. Run the container image

With the below command, we will run the container “greetingapp”, which will then be exposed on localhost (127.0.0.1) and port “8081” (mapped to container port 8080)
```
docker run -d --name greetingapp greeting:1.0 -p 127.0.0.1:8081:8080/tcp
```

5. Access the application and see how it works, ta-da..
```
http://localhost:8081/index.html
```

### Reference:
1. Using WebSocket to build an interactive web application https://spring.io/guides/gs/messaging-stomp-websocket/ 
2. Multi stage build with Docker: https://docs.docker.com/develop/develop-images/multistage-build/

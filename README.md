# Dockerized Versioned Cloud Config

## Table of Contents
1. [Intro](#intro)
2. [Usage](#usage)
3. [Modules](#modules)  
3.1 [Docker](#docker)  
3.2 [Config Server](#config-server)  
3.3 [RabbitMQ](#rabbitmq)  
3.4 [Config Client](#config-client)
4. [Resources](#resources)

## Intro
Properties are stored in a Git repository.  
All clients are registered to a RabbitMQ Queue.  
Docker orchestrates the deployment of the system:
1. RabbitMQ (Queue)
2. Confic-server (Server)
3. Department-service (Client1)
4. Employee-service (Client2)

When the property changes are merged into the master branch, the system should pickup these configuration changes.  

Upon a actuator/bus-refresh event on any client, the queue broadcasts(POST) the actuator/refresh event on each registered client, refetching the  their respective properties.  

Inline-style: 
![alt text](https://chathurangat.files.wordpress.com/2018/07/untitled-diagram-9.png "Logo Title Text 1")

## Usage
```bash
cd <<project_root>>
## Build all projects
mvn clean install 
## copy all jars into the ./docker/files directory
mv ./target

```
## Modules
The project root contains multiple folders
* docker 
* configuration repository
* server
* client1
* client2


### Docker
The docker folder contains all the deployables   

File structure: 
```bash
# All the docker 
<<project_root>>/docker  
# the files folder contains all the deployables  
<<project_root>>/docker/files  
# to enable Certificates  
<<project_root>>/docker/files/UnlimitedJCEPolicyJDK8  
```

### Config Server
application.properties contains system wide properties that are distributed between all the microservices that consume the config server.  
Typically the database config is stored at this point
```bash

```

### RabbitMQ

### Config Client
There are two Clients

```bash
http://localhost:8081/service
http://localhost:8081/actuator/bus-refresh
```

## Resources
https://springbootdev.com/2018/07/17/spring-cloud-config-refreshing-the-config-changes-with-spring-cloud-bus-part-2/
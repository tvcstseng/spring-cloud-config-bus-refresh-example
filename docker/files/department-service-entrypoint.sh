#!/bin/sh

while ! nc -z config-server 8888 ; do
    echo "Waiting for upcoming Config Server"
    sleep 10
done

# echo "CURL http://root:s3cr3t@config-server:8888"
# curl http://root:s3cr3t@config-server:8888

java -jar /opt/spring-cloud/lib/department-service.jar

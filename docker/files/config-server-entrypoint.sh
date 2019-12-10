#!/bin/sh

while ! nc -z rabbitmq 5672 ; do
    echo "Waiting for upcoming RabbitMQ"
    sleep 10
done

# echo "CURL http://root:s3cr3t@rabbitmq:8888"
# curl http://root:s3cr3t@rabbitmq:8888

java -jar /opt/spring-cloud/lib/config-server.jar

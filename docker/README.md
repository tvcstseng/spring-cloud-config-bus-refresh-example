```bash
# Build from Dockerfile
docker build --file=Dockerfile.department_service --tag=department-service:latest --rm=true .
docker build --file=Dockerfile.employee_service --tag=employee-service:latest --rm=true .

docker container run  -it --name employee-service employee-service

docker-compose up --build
```

```bash
department-service:
        container_name: department-service
        build:
            context: .
            dockerfile: Dockerfile.department_service
        image: department-service:latest
        entrypoint: /opt/spring-cloud/bin/department-service-entrypoint.sh
        environment:
            SPRING_APPLICATION_JSON: '{"spring": {"cloud": {"config": {"uri": "http://config-server:8888"}}}}'
        expose:
            - 8081
        ports:
            - 8081:8081
        networks:
            - spring-cloud-network
        links:
            - config-server:config-server
        depends_on:
            - config-server
        logging:
            driver: json-file
```
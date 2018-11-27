#!/bin/bash

docker-compose down -v 

docker build -t suricata ./suricata
docker build -t logstash ./logstash
docker build -t filebeat ./filebeat
docker build -t evebox ./evebox

docker-compose up -d

docker container exec -it suricata /bin/bash
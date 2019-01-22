#!/bin/bash

docker-compose down

docker build -t logstash ./logstash
docker build -t evebox ./evebox

docker-compose up -d

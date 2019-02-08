# Evebox Setup

This document describes how to setup Evebox with Elasticsearch, Logstash and Kibana in docker containers on a CentOS server to index Suricata events.

## Requirements

It is recommended to run this setup on a server with 4 available cores and 8GB of memory. Storage requirements will depend on the amount of data indexed by elasticsearch.

## Installation

#### docker

Install `docker` and its dependencies

```console
$ sudo yum install -y yum-utils device-mapper-persistent-data lvm2
```

```console
$ sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
```

```console
$ sudo yum install -y docker-ce
```

Start `docker`

```console
$ sudo systemctl start docker
```

#### docker-compose

Install `docker-compose`

```console
$ sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

Grant execute permissions to the `docker-compose` binary
```compose
$ sudo chmod +x /usr/local/bin/docker-compose
```

#### Elasticsearch, Logstash, Kibana and Evebox

The `evebox` stack is set up in `docker` containers using `docker-compose`. 

Clone the repo to download required files

```console
$ git clone https://github.com/counterflow-ai/eve-elk.git
```

Run `docker-compose up -d` to start the containers in detached mode

```console
$ cd eve-elk
$ docker-compose up -d
```

It will take a couple of minutes for all containers to start. Run the `docker ps` command to check the status of the containers

```console
$ docker ps

CONTAINER ID        IMAGE                                                 COMMAND                  CREATED             STATUS              PORTS                              NAMES
3dd456752a57        counterflow/evebox                                    "/docker-entrypoint.…"   About an hour ago   Up 7 seconds        0.0.0.0:5636->5636/tcp             evebox
57cfd7580ccc        docker.elastic.co/elasticsearch/elasticsearch:6.3.2   "/usr/local/bin/dock…"   About an hour ago   Up 9 seconds        0.0.0.0:9200->9200/tcp, 9300/tcp   elasticsearch
051f764ab830        docker.elastic.co/kibana/kibana:6.3.2                 "/usr/local/bin/kiba…"   About an hour ago   Up 9 seconds        0.0.0.0:5601->5601/tcp             kibana
65c2e6ee1170        docker.elastic.co/logstash/logstash:6.3.2             "/usr/local/bin/dock…"   About an hour ago   Up 9 seconds        0.0.0.0:5044->5044/tcp, 9600/tcp   logstash
```

## Usage

Visit `http://<host>:5636` in your browser to access the evebox console. Go to the evebox project [github repository](https://github.com/counterflow-ai/evebox) for more details.
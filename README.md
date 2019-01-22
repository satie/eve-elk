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

Grant execute permissions to the `bootstrap.sh` script.  Run the script to stop any running containers, create the necessary docker images and start the containers from the created images. 

```console
$ cd eve-elk
$ chmod +x bootstrap.sh
$ ./bootstrap.sh
```

It will take a couple of minutes for all containers to start. Run the `docker ps` command to check the status of the containers

```console
$ docker ps

CONTAINER ID        IMAGE                                                 COMMAND                  CREATED             STATUS              PORTS                                            NAMES
bf11c19680f7        evebox                                                "/bin/sh -c 'evebox …"   1 minute ago        Up 1 minute         0.0.0.0:5636->5636/tcp                           evebox
72ecb50532bd        logstash                                              "/usr/local/bin/dock…"   1 minute ago        Up 1 minute         0.0.0.0:5044->5044/tcp, 9600/tcp                 logstash
1ee614b8d284        docker.elastic.co/elasticsearch/elasticsearch:6.3.2   "/usr/local/bin/dock…"   1 minute ago        Up 1 minute         0.0.0.0:9200->9200/tcp, 0.0.0.0:9300->9300/tcp   elasticsearch
4db1224c5838        docker.elastic.co/kibana/kibana:6.3.2                 "/usr/local/bin/kiba…"   1 minute ago        Up 1 minute         0.0.0.0:5601->5601/tcp                           kibana
```

## Usage

Visit `http://<host>:5636` in your browser to access the evebox console. Go to the evebox project [github repository](https://github.com/counterflow-ai/evebox) for more details.
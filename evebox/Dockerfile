FROM debian:stretch

ARG INDEX=logstash
ARG ELASTICSEARCH=http://localhost:9200

# COPY ./evebox-latest-amd64.deb /root
RUN apt-get update
RUN apt-get install -y wget
RUN wget -O /root/evebox-latest-amd64.deb http://ci-artifacts.counterflowai.com.s3.amazonaws.com/master/evebox-latest-amd64.deb

RUN dpkg -i ./root/evebox-latest-amd64.deb

# RUN apt update
# RUN apt install -y wget build-essential
# RUN wget -qO - https://evebox.org/files/GPG-KEY-evebox | apt-key add -
# RUN echo "deb http://files.evebox.org/evebox/debian stable main" | tee /etc/apt/sources.list.d/evebox.list
# RUN apt update
# RUN apt install evebox

CMD evebox -v -e $ELASTICSEARCH -i $INDEX --elasticsearch-keyword keyword

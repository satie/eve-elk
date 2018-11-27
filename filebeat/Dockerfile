FROM docker.elastic.co/beats/filebeat:6.3.2

COPY ./filebeat.yml /usr/share/filebeat/filebeat.yml

USER root

RUN mkdir -p /var/log/suricata

RUN chown root:filebeat /usr/share/filebeat/filebeat.yml

USER filebeat
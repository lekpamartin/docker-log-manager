FROM docker.elastic.co/beats/filebeat:6.6.2
LABEL maintainer="LEKPA"

COPY files/filebeat.yml /usr/share/filebeat/filebeat.yml

USER root

RUN yum -y update

USER filebeat

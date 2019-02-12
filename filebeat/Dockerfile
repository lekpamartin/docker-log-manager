FROM docker.elastic.co/beats/filebeat:6.6.0
LABEL maintainer="LEKPA"

COPY files/filebeat.yml /usr/share/filebeat/filebeat.yml

USER root
RUN yum -y update

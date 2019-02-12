FROM docker.elastic.co/logstash/logstash:6.6.0
LABEL maintainer="LEKPA"

#COPY files/conf.d /usr/share/logstash/config/conf.d
COPY files /usr/share/logstash/config

USER root
RUN yum -y update
USER logstash

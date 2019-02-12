FROM docker.elastic.co/logstash/logstash:6.6.0
LABEL maintainer="LEKPA"

COPY files/conf.d /usr/share/logstash/config/conf.d

RUN yum -y update

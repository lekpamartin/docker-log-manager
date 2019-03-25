FROM logstash:6.6.2
LABEL maintainer="LEKPA"

COPY files /usr/share/logstash/config

USER root
RUN yum -y update
USER logstash

#!/bin/bash

REPO="lekpamartin"

TYPE="logstash-docker"
TAG="6.6.0"

docker build \
        --no-cache \
        -t ${REPO}/${TYPE}:"${TAG}" .

if [ "$?" == 0 ]; then
        echo -e "\n\t\t\t- status : ${REPO}/${TYPE}:${TAG} -> OK"
        docker push ${REPO}/${TYPE}:${TAG}
else
        echo -e "\n\t\t\t- status : ${REPO}/${TYPE}:${TAG} -> KO"
fi

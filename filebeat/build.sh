#!/bin/bash

SGDSI_REPO="lekpamartin"

TYPE="filebeat-docker"
TAG="6.6.0"

docker build \
        --no-cache \
        -t ${SGDSI_REPO}/${TYPE}:"${TAG}" .

if [ "$?" == 0 ]; then
	echo -e "\n\t\t\t- status : ${SGDSI_REPO}/${TYPE}:${TAG} -> OK"
	docker push ${SGDSI_REPO}/${TYPE}:${TAG}
else
	echo -e "\n\t\t\t- status : ${SGDSI_REPO}/${TYPE}:${TAG} -> KO"
fi

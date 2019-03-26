#!/bin/bash

REPO="lekpamartin"

TYPE="kibana-docker-containers-log-manager"
TAG=`grep FROM Dockerfile | cut -d ':' -f2`

docker build \
	--no-cache \
	--build-arg http_proxy="${http_proxy}" \
	--build-arg https_proxy="${https_proxy}" \
	-t ${REPO}/${TYPE}:"${TAG}" .

if [ "$?" == 0 ]; then
	echo -e "\n\t\t\t- status : ${REPO}/${TYPE}:${TAG} -> OK"
	docker push ${REPO}/${TYPE}:${TAG}
else
	echo -e "\n\t\t\t- status : ${REPO}/${TYPE}:${TAG} -> KO"
fi

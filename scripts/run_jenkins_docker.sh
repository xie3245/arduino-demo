#!/bin/bash

BASEDIR=$(dirname "$0")

cd $BASEDIR/../
echo $PWD

docker run \
  --name jenkins-blueocean \
  --rm -w /opt/workspace \
  --detach  --network jenkins \
  --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client \
  --env DOCKER_TLS_VERIFY=1 \
  --publish 8080:8080 \
  --publish 50000:50000 \
  --volume $PWD:/opt/workspace --volume jenkins-data:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client:ro --device=/dev/ttyACM0 \
  jenkins-avr:1.0
#!/bin/bash

BASEDIR=$(dirname "$0")
cd $BASEDIR/../
echo $PWD
docker build -t jenkins-avr:1.0 docker/jenkins/

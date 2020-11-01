#!/bin/bash

BASEDIR=$(dirname "$0")
cd $BASEDIR/../
echo $(pwd)

docker run -v $PWD:/workdir -w /workdir --device /dev/ttyACM0 avr-build-env:1.0 sh ./scripts/cmake_build.sh

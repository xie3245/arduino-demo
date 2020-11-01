#!/bin/sh

BASEDIR=$(dirname "$0")
cd $BASEDIR/../
echo $(pwd)

cmake -S. -Bbuild -DARDUINO=ON
cmake --build build -j ${nproc}
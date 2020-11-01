BASEDIR=$(dirname "$0")
cd $BASEDIR/../
echo $(pwd)
docker build -t avr-build-env:1.0 $PWD/docker/avr/
#!/bin/sh

echo "delpoying ${1}"
avrdude -F -V -c arduino -p ATMEGA328P -P /dev/ttyACM0 -b 115200 -U flash:w:${1}
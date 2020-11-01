#!/bin/bash

echo "building file ${1}"
avr-gcc -Os -DF_CPU=16000000UL -mmcu=atmega328p -c -o demo.o ${1}
avr-gcc -o demo.bin demo.o
avr-objcopy -O ihex -R .eeprom demo.bin demo.hex 
avrdude -F -V -c arduino -p ATMEGA328P -P /dev/ttyACM0 -b 115200 -U flash:w:demo.hex
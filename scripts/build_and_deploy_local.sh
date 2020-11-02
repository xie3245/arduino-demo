#!/bin/bash

echo "building files" "$@"
avr-gcc -Os -DF_CPU=16000000UL -mmcu=atmega328p -o demo.bin "$@"
avr-objcopy -O ihex -R .eeprom demo.bin demo.hex 
avrdude -F -V -c arduino -p ATMEGA328P -P /dev/ttyACM0 -b 115200 -U flash:w:demo.hex
rm demo.bin demo.hex
FROM alpine:3.12

USER root
RUN apk add --no-cache \
    avr-libc avrdude binutils-avr gcc-avr make cmake g++

RUN adduser -D user
USER user
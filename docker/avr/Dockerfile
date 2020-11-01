FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends avr-libc && \
    apt-get install -y --no-install-recommends avrdude && \
    apt-get install -y --no-install-recommends binutils-avr gcc-avr && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
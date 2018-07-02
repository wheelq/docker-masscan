FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN true \
    && apt-get update \
    && apt-get install -y \
        curl \
        git \
        build-essential \
        libpcap-dev \
    && apt-get clean

WORKDIR /

RUN git clone https://github.com/robertdavidgraham/masscan

WORKDIR /masscan

RUN make -j

ENTRYPOINT ["/masscan/bin/masscan"]

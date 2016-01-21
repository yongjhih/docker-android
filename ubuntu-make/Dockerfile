FROM ubuntu

MAINTAINER Andrew Chen <yongjhih@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update && apt-get install -y wget git curl zip software-properties-common && \
    add-apt-repository ppa:ubuntu-desktop/ubuntu-make && \
    apt-get update && apt-get install -y ubuntu-make && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

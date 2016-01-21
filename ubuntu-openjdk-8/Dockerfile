FROM ubuntu

MAINTAINER Andrew Chen <yongjhih@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y wget git curl zip software-properties-common && \
    add-apt-repository ppa:openjdk-r/ppa && \
    apt-get update && apt-get install -y openjdk-7-jdk openjdk-8-jdk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

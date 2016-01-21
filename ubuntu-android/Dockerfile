FROM ubuntu

MAINTAINER Andrew Chen <yongjhih@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update && apt-get install -y wget git curl zip software-properties-common && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN add-apt-repository ppa:openjdk-r/ppa
RUN apt-get update && apt-get install -y openjdk-7-jdk openjdk-8-jdk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN add-apt-repository ppa:ubuntu-desktop/ubuntu-make
RUN apt-get update && apt-get install -y ubuntu-make && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN umake android android-sdk --accept-license /usr/local/share/umake/android/android-sdk

COPY android.sh /etc/profile.d/android.sh

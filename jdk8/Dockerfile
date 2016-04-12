FROM yongjhih/ubuntu-openjdk-8

ENV ANDROID_SDK_ZIP http://dl.google.com/android/android-sdk_r24.3.4-linux.tgz

RUN wget $ANDROID_SDK_ZIP -O - | tar zxv -C /opt

ENV ANDROID_HOME /opt/android-sdk-linux

ENV PATH $PATH:$ANDROID_HOME/tools
ENV PATH $PATH:$ANDROID_HOME/platform-tools

RUN apt-get update && \
    apt-get install -y libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

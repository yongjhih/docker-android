FROM java:7

ENV ANDROID_SDK_ZIP http://dl.google.com/android/android-sdk_r24.3.4-linux.tgz

RUN wget $ANDROID_SDK_ZIP -O - | tar zxv -C /opt

ENV ANDROID_HOME /opt/android-sdk-linux
ENV ANDROID_SDK $ANDROID_HOME

ENV PATH $PATH:$ANDROID_HOME/tools
ENV PATH $PATH:$ANDROID_HOME/platform-tools

RUN apt-get update && \
    apt-get install --no-install-recommends -y libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# https://github.com/yongjhih/docker-android/blob/master/ubuntu-openjdk-8-android-extra/Dockerfile
RUN echo "y" | android update sdk -u -a --filter tools && \
    echo "y" | android update sdk -u -a --filter platform-tools

ENV TINI_VERSION v0.9.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

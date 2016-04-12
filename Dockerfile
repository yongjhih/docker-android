FROM java:7

ENV ANDROID_SDK_ZIP http://dl.google.com/android/android-sdk_r24.3.4-linux.tgz

RUN wget $ANDROID_SDK_ZIP -O - | tar zxv -C /opt

ENV ANDROID_HOME /opt/android-sdk-linux

ENV PATH $PATH:$ANDROID_HOME/tools
ENV PATH $PATH:$ANDROID_HOME/platform-tools

RUN apt-get update && \
    apt-get install --no-install-recommends -y libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# https://github.com/yongjhih/docker-android/blob/master/ubuntu-openjdk-8-android-extra/Dockerfile
RUN echo "y" | android update sdk -u -a --filter tools && \
    echo "y" | android update sdk -u -a --filter platform-tools

# https://github.com/yongjhih/docker-android/blob/master/ubuntu-openjdk-8-android-all/Dockerfile
RUN echo "y" | android update sdk -u -a --filter android-19 && \
    echo "y" | android update sdk -u -a --filter build-tools-19.1.0 && \
    echo "y" | android update sdk -u -a --filter build-tools-19.0.3 && \
    echo "y" | android update sdk -u -a --filter build-tools-19.0.2 && \
    echo "y" | android update sdk -u -a --filter build-tools-19.0.1

RUN echo "y" | android update sdk -u -a --filter android-20 && \
    echo "y" | android update sdk -u -a --filter build-tools-20.0.0

RUN echo "y" | android update sdk -u -a --filter android-21 && \
    echo "y" | android update sdk -u -a --filter build-tools-21.1.2 && \
    echo "y" | android update sdk -u -a --filter build-tools-21.1.1 && \
    echo "y" | android update sdk -u -a --filter build-tools-21.1.0 && \
    echo "y" | android update sdk -u -a --filter build-tools-21.0.2 && \
    echo "y" | android update sdk -u -a --filter build-tools-21.0.1 && \
    echo "y" | android update sdk -u -a --filter build-tools-21.0.0

RUN echo "y" | android update sdk -u -a --filter android-22 && \
    echo "y" | android update sdk -u -a --filter build-tools-22.0.1 && \
    echo "y" | android update sdk -u -a --filter build-tools-22.0.0

RUN echo "y" | android update sdk -u -a --filter android-23 && \
    echo "y" | android update sdk -u -a --filter build-tools-23.0.3 && \
    echo "y" | android update sdk -u -a --filter build-tools-23.0.2 && \
    echo "y" | android update sdk -u -a --filter build-tools-23.0.1 && \
    echo "y" | android update sdk -u -a --filter build-tools-23.0.0

RUN echo "y" | android update sdk -u -a --filter extra-android-support && \
    echo "y" | android update sdk -u -a --filter extra-android-m2repository && \
    echo "y" | android update sdk -u -a --filter extra-google-google_play_services && \
    echo "y" | android update sdk -u -a --filter extra-google-m2repository && \
    echo "y" | android update sdk -u -a --filter extra-google-analytics_sdk_v2

ENV TINI_VERSION v0.9.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

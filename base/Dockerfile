FROM java:8

RUN apt-get update && \
    apt-get install --no-install-recommends -y libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1 ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV GOSU_VERSION 1.11
RUN dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')" && \
    wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch" && \
    wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc" && \
    chmod +x /usr/local/bin/gosu && \
    export GNUPGHOME="$(mktemp -d)" && \
    gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 && \
    gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu && \
    rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc

ENV ANDROID_SDK_ZIP https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip

RUN wget $ANDROID_SDK_ZIP -O /tmp/android-sdk-tools.zip && \
    unzip /tmp/android-sdk-tools.zip -d /android-sdk && \
    rm /tmp/android-sdk-tools.zip

ENV ANDROID_HOME /android-sdk
ENV ANDROID_SDK $ANDROID_HOME

ENV PATH $PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin

RUN chmod -R a+w /android-sdk

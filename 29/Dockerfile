FROM java:8

RUN rm /etc/apt/sources.list && \
    rm -rf /etc/apt/sources.list.d && \
    printf "deb http://archive.debian.org/debian/ jessie main\ndeb-src http://archive.debian.org/debian/ jessie main\ndeb http://security.debian.org jessie/updates main\ndeb-src http://security.debian.org jessie/updates main" > /etc/apt/sources.list && \
    apt-get update && \
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

#  build-tools;29.0.1                                  | 29.0.1       | Android SDK Build-Tools 29.0.1                  | build-tools/29.0.1/
#  build-tools;29.0.2                                  | 29.0.2       | Android SDK Build-Tools 29.0.2                  | build-tools/29.0.2/
#  emulator                                            | 29.2.1       | Android Emulator                                | emulator/
#  platform-tools                                      | 29.0.4       | Android SDK Platform-Tools                      | platform-tools/
#  platforms;android-29                                | 3            | Android SDK Platform 29                         | platforms/android-29/
#  sources;android-29                                  | 1            | Sources for Android 29                          | sources/android-29/
#  system-images;android-29;google_apis;x86            | 8            | Google APIs Intel x86 Atom System Image         | system-images/android-29/google_apis/x86/
#  build-tools;29.0.0                                                                       | 29.0.0       | Android SDK Build-Tools 29
#  build-tools;29.0.1                                                                       | 29.0.1       | Android SDK Build-Tools 29.0.1
#  build-tools;29.0.2                                                                       | 29.0.2       | Android SDK Build-Tools 29.0.2
#  build-tools;29.0.3                                                                       | 29.0.3       | Android SDK Build-Tools 29.0.3
#  platform-tools                                                                           | 29.0.6       | Android SDK Platform-Tools
#  platforms;android-29                                                                     | 4            | Android SDK Platform 29
#  sources;android-29                                                                       | 1            | Sources for Android 29
#  system-images;android-29;default;x86                                                     | 7            | Intel x86 Atom System Image
#  system-images;android-29;default;x86_64                                                  | 7            | Intel x86 Atom_64 System Image
#  system-images;android-29;google_apis;x86                                                 | 9            | Google APIs Intel x86 Atom System Image
#  system-images;android-29;google_apis;x86_64                                              | 9            | Google APIs Intel x86 Atom_64 System Image
#  system-images;android-29;google_apis_playstore;x86                                       | 8            | Google Play Intel x86 Atom System Image
#  system-images;android-29;google_apis_playstore;x86_64                                    | 8            | Google Play Intel x86 Atom_64 System Image
#  emulator                                 | 29.2.1       | 30.0.0
#  platform-tools                           | 29.0.4       | 29.0.6
#  platforms;android-29                     | 3            | 4
#  system-images;android-29;google_apis;x86 | 8            | 9
RUN (echo y; echo y; echo y; echo y; echo y; echo y; echo y) | sdkmanager  --licenses && \
    sdkmanager "build-tools;29.0.0" \
               "build-tools;29.0.1" \
               "build-tools;29.0.2" \
               "build-tools;29.0.3"

# We'd not install platform;android-* in this image, because currently build-tools can automatically install the corresponding android platform

RUN chmod -R a+w /android-sdk

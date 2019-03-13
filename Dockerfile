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

RUN (echo y; echo y; echo y; echo y; echo y; echo y) | sdkmanager  --licenses && \
    sdkmanager "build-tools;24.0.0" \
               "build-tools;24.0.1" \
               "build-tools;24.0.2" \
               "build-tools;24.0.3" \
               "build-tools;25.0.0" \
               "build-tools;25.0.1" \
               "build-tools;25.0.2" \
               "build-tools;25.0.3" \
               "build-tools;26.0.0" \
               "build-tools;26.0.1" \
               "build-tools;26.0.2" \
               "build-tools;26.0.3" \
               "build-tools;27.0.0" \
               "build-tools;27.0.1" \
               "build-tools;27.0.2" \
               "build-tools;27.0.3" \
               "build-tools;28.0.0" \
               "build-tools;28.0.0-rc1" \
               "build-tools;28.0.0-rc2" \
               "build-tools;28.0.1" \
               "build-tools;28.0.2" \
               "build-tools;28.0.3"

# We'd not install platform;android-* in this image, because currently build-tools can automatically install the corresponding android platform
#
# other known packages:
#   extras;android;gapid;1                                                                   | 1.0.3        | GPU Debugging tools
#   extras;android;gapid;3                                                                   | 3.1.0        | GPU Debugging tools
#   extras;android;m2repository                                                              | 47.0.0       | Android Support Repository
#   extras;google;auto                                                                       | 1.1          | Android Auto Desktop Head Unit emulator
#   extras;google;google_play_services                                                       | 49           | Google Play services
#   extras;google;instantapps                                                                | 1.5.0        | Google Play Instant Development SDK
#   extras;google;m2repository                                                               | 58           | Google Repository
#   extras;google;market_apk_expansion                                                       | 1            | Google Play APK Expansion library
#   extras;google;market_licensing                                                           | 1            | Google Play Licensing Library
#   extras;google;simulators                                                                 | 1            | Android Auto API Simulators
#   extras;google;webdriver                                                                  | 2            | Google Web Driver
#   extras;m2repository;com;android;support;constraint;constraint-layout-solver;1.0.0        | 1            | Solver for ConstraintLayout 1.0.0
#   extras;m2repository;com;android;support;constraint;constraint-layout-solver;1.0.0-alpha2 | 1            | com.android.support.constraint:constraint-layout-solver:1.0.0-alpha2
#   extras;m2repository;com;android;support;constraint;constraint-layout-solver;1.0.0-alpha3 | 1            | com.android.support.constraint:constraint-layout-solver:1.0.0-alpha3
#   extras;m2repository;com;android;support;constraint;constraint-layout-solver;1.0.0-alpha4 | 1            | com.android.support.constraint:constraint-layout-solver:1.0.0-alpha4
#   extras;m2repository;com;android;support;constraint;constraint-layout-solver;1.0.0-alpha5 | 1            | Solver for ConstraintLayout 1.0.0-alpha5
#   extras;m2repository;com;android;support;constraint;constraint-layout-solver;1.0.0-alpha6 | 1            | Solver for ConstraintLayout 1.0.0-alpha6
#   extras;m2repository;com;android;support;constraint;constraint-layout-solver;1.0.0-alpha7 | 1            | Solver for ConstraintLayout 1.0.0-alpha7
#   extras;m2repository;com;android;support;constraint;constraint-layout-solver;1.0.0-alpha8 | 1            | Solver for ConstraintLayout 1.0.0-alpha8
#   extras;m2repository;com;android;support;constraint;constraint-layout-solver;1.0.0-alpha9 | 1            | Solver for ConstraintLayout 1.0.0-alpha9
#   extras;m2repository;com;android;support;constraint;constraint-layout-solver;1.0.0-beta1  | 1            | Solver for ConstraintLayout 1.0.0-beta1
#   extras;m2repository;com;android;support;constraint;constraint-layout-solver;1.0.0-beta2  | 1            | Solver for ConstraintLayout 1.0.0-beta2
#   extras;m2repository;com;android;support;constraint;constraint-layout-solver;1.0.0-beta3  | 1            | Solver for ConstraintLayout 1.0.0-beta3
#   extras;m2repository;com;android;support;constraint;constraint-layout-solver;1.0.0-beta4  | 1            | Solver for ConstraintLayout 1.0.0-beta4
#   extras;m2repository;com;android;support;constraint;constraint-layout-solver;1.0.0-beta5  | 1            | Solver for ConstraintLayout 1.0.0-beta5
#   extras;m2repository;com;android;support;constraint;constraint-layout-solver;1.0.1        | 1            | Solver for ConstraintLayout 1.0.1
#   extras;m2repository;com;android;support;constraint;constraint-layout-solver;1.0.2        | 1            | Solver for ConstraintLayout 1.0.2
#   extras;m2repository;com;android;support;constraint;constraint-layout;1.0.0               | 1            | ConstraintLayout for Android 1.0.0
#   extras;m2repository;com;android;support;constraint;constraint-layout;1.0.0-alpha2        | 1            | com.android.support.constraint:constraint-layout:1.0.0-alpha2
#   extras;m2repository;com;android;support;constraint;constraint-layout;1.0.0-alpha3        | 1            | com.android.support.constraint:constraint-layout:1.0.0-alpha3
#   extras;m2repository;com;android;support;constraint;constraint-layout;1.0.0-alpha4        | 1            | com.android.support.constraint:constraint-layout:1.0.0-alpha4
#   extras;m2repository;com;android;support;constraint;constraint-layout;1.0.0-alpha5        | 1            | ConstraintLayout for Android 1.0.0-alpha5
#   extras;m2repository;com;android;support;constraint;constraint-layout;1.0.0-alpha6        | 1            | ConstraintLayout for Android 1.0.0-alpha6
#   extras;m2repository;com;android;support;constraint;constraint-layout;1.0.0-alpha7        | 1            | ConstraintLayout for Android 1.0.0-alpha7
#   extras;m2repository;com;android;support;constraint;constraint-layout;1.0.0-alpha8        | 1            | ConstraintLayout for Android 1.0.0-alpha8
#   extras;m2repository;com;android;support;constraint;constraint-layout;1.0.0-alpha9        | 1            | ConstraintLayout for Android 1.0.0-alpha9
#   extras;m2repository;com;android;support;constraint;constraint-layout;1.0.0-beta1         | 1            | ConstraintLayout for Android 1.0.0-beta1
#   extras;m2repository;com;android;support;constraint;constraint-layout;1.0.0-beta2         | 1            | ConstraintLayout for Android 1.0.0-beta2
#   extras;m2repository;com;android;support;constraint;constraint-layout;1.0.0-beta3         | 1            | ConstraintLayout for Android 1.0.0-beta3
#   extras;m2repository;com;android;support;constraint;constraint-layout;1.0.0-beta4         | 1            | ConstraintLayout for Android 1.0.0-beta4
#   extras;m2repository;com;android;support;constraint;constraint-layout;1.0.0-beta5         | 1            | ConstraintLayout for Android 1.0.0-beta5
#   extras;m2repository;com;android;support;constraint;constraint-layout;1.0.1               | 1            | ConstraintLayout for Android 1.0.1
#   extras;m2repository;com;android;support;constraint;constraint-layout;1.0.2               | 1            | ConstraintLayout for Android 1.0.2

RUN chmod -R a+w /android-sdk

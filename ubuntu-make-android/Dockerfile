FROM ubuntu-make

RUN add-apt-repository ppa:openjdk-r/ppa
RUN apt-get update && apt-get install -y openjdk-7-jdk openjdk-8-jdk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN umake android android-sdk --accept-license /usr/local/share/umake/android/android-sdk

ENV ANDROID_HOME /usr/local/share/umake/android/android-sdk
ENV PATH $ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH

COPY android.sh /etc/profile.d/android.sh

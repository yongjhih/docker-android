FROM jenkins

USER root

RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN add-apt-repository ppa:ubuntu-desktop/ubuntu-make
RUN apt-get update && apt-get install -y openjdk-7-jdk openjdk-8-jdk ubuntu-make

RUN umake android android-sdk
ENV ANDROID_HOME /root/.local/share/umake/android/android-sdk
ENV PATH $ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH

RUN echo "y" | android update sdk -u -a --filter platform-tools,android-23,build-tools-23.0.1,extra-android-support,extra-android-m2repository,extra-google-google_play_services

USER jenkins

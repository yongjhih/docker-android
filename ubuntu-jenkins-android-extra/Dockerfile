FROM yongjhih/ubuntu-jenkins-android

MAINTAINER Andrew Chen <yongjhih@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

USER root

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ENV ANDROID_HOME /usr/local/share/umake/android/android-sdk
ENV PATH $ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH

RUN echo "y" | android update sdk -u -a --filter platform-tools,extra-android-support,extra-android-m2repository,extra-google-google_play_services

RUN find $ANDROID_HOME -type d -exec chmod a+x {} \;
RUN chmod -R a+r $ANDROID_HOME

USER jenkins

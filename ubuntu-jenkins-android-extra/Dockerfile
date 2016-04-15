FROM yongjhih/ubuntu-jenkins-android

MAINTAINER Andrew Chen <yongjhih@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

USER root

RUN echo "y" | android update sdk -u -a --filter extra-android-support && \
    echo "y" | android update sdk -u -a --filter extra-android-m2repository && \
    echo "y" | android update sdk -u -a --filter extra-google-google_play_services && \
    echo "y" | android update sdk -u -a --filter extra-google-m2repository && \
    echo "y" | android update sdk -u -a --filter extra-google-analytics_sdk_v2

#RUN find $ANDROID_HOME -type d -exec chmod a+x {} \;
#RUN chmod -R a+r $ANDROID_HOME

USER jenkins

FROM yongjhih/ubuntu-jenkins-android-20

MAINTAINER Andrew Chen <yongjhih@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

USER root

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ENV ANDROID_HOME /usr/local/share/umake/android/android-sdk
ENV PATH $ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH

RUN echo "y" | android update sdk -u -a --filter android-21
RUN echo "y" | android update sdk -u -a --filter build-tools-21.1.2
RUN echo "y" | android update sdk -u -a --filter build-tools-21.1.1
RUN echo "y" | android update sdk -u -a --filter build-tools-21.1.0
RUN echo "y" | android update sdk -u -a --filter build-tools-21.0.2
RUN echo "y" | android update sdk -u -a --filter build-tools-21.0.1
RUN echo "y" | android update sdk -u -a --filter build-tools-21.0.0

RUN find $ANDROID_HOME -type d -exec chmod a+x {} \;
RUN chmod -R a+r $ANDROID_HOME

USER jenkins

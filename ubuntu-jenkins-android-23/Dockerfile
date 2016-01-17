FROM yongjhih/ubuntu-jenkins-android-22

MAINTAINER Andrew Chen <yongjhih@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

USER root

RUN echo "y" | android update sdk -u -a --filter android-23
RUN echo "y" | android update sdk -u -a --filter build-tools-23.0.2
RUN echo "y" | android update sdk -u -a --filter build-tools-23.0.1
RUN echo "y" | android update sdk -u -a --filter build-tools-23.0.0

#RUN find $ANDROID_HOME -type d -exec chmod a+x {} \;
#RUN chmod -R a+r $ANDROID_HOME

USER jenkins

FROM yongjhih/ubuntu-jenkins-android-21

MAINTAINER Andrew Chen <yongjhih@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

USER root

RUN echo "y" | android update sdk -u -a --filter android-22
RUN echo "y" | android update sdk -u -a --filter build-tools-22.0.1
RUN echo "y" | android update sdk -u -a --filter build-tools-22.0.0

#RUN find $ANDROID_HOME -type d -exec chmod a+x {} \;
#RUN chmod -R a+r $ANDROID_HOME

USER jenkins

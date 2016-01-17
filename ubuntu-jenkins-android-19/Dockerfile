FROM yongjhih/ubuntu-jenkins-android-extra

MAINTAINER Andrew Chen <yongjhih@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

USER root

RUN echo "y" | android update sdk -u -a --filter android-19
RUN echo "y" | android update sdk -u -a --filter build-tools-19.1.0
RUN echo "y" | android update sdk -u -a --filter build-tools-19.0.3
RUN echo "y" | android update sdk -u -a --filter build-tools-19.0.2
RUN echo "y" | android update sdk -u -a --filter build-tools-19.0.1

#RUN find $ANDROID_HOME -type d -exec chmod a+x {} \;
#RUN chmod -R a+r $ANDROID_HOME

USER jenkins

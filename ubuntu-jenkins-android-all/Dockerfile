FROM yongjhih/ubuntu-jenkins-android-extra

MAINTAINER Andrew Chen <yongjhih@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

USER root

RUN echo "y" | android update sdk -u -a --filter android-23

RUN echo "y" | android update sdk -u -a --filter build-tools-23.0.2
RUN echo "y" | android update sdk -u -a --filter build-tools-23.0.1
RUN echo "y" | android update sdk -u -a --filter build-tools-23.0.0

RUN echo "y" | android update sdk -u -a --filter android-22
RUN echo "y" | android update sdk -u -a --filter build-tools-22.0.1
RUN echo "y" | android update sdk -u -a --filter build-tools-22.0.0

RUN echo "y" | android update sdk -u -a --filter android-21
RUN echo "y" | android update sdk -u -a --filter build-tools-21.1.2
RUN echo "y" | android update sdk -u -a --filter build-tools-21.1.1
RUN echo "y" | android update sdk -u -a --filter build-tools-21.1.0
RUN echo "y" | android update sdk -u -a --filter build-tools-21.0.2
RUN echo "y" | android update sdk -u -a --filter build-tools-21.0.1
RUN echo "y" | android update sdk -u -a --filter build-tools-21.0.0

RUN echo "y" | android update sdk -u -a --filter android-20
RUN echo "y" | android update sdk -u -a --filter build-tools-20.0.0

RUN echo "y" | android update sdk -u -a --filter android-19
RUN echo "y" | android update sdk -u -a --filter build-tools-19.1.0
RUN echo "y" | android update sdk -u -a --filter build-tools-19.0.3
RUN echo "y" | android update sdk -u -a --filter build-tools-19.0.2
RUN echo "y" | android update sdk -u -a --filter build-tools-19.0.1

#RUN find $ANDROID_HOME -type d -exec chmod a+x {} \;
#RUN chmod -R a+r $ANDROID_HOME

# MISC {{{
RUN curl https://storage.googleapis.com/git-repo-downloads/repo > /usr/local/bin/repo
RUN chmod a+x /usr/local/bin/repo

#RUN chmod a+x $ANDROID_HOME/tools/*
#RUN chmod a+x $ANDROID_HOME/platform-tools/*
# MISC }}}

USER jenkins

FROM yongjhih/ubuntu-openjdk-8

RUN wget http://dl.google.com/android/android-sdk_r24.3.4-linux.tgz -O - | tar zxv -C /opt

ENV ANDROID_HOME /opt/android-sdk-linux

ENV PATH $PATH:$ANDROID_HOME/tools
ENV PATH $PATH:$ANDROID_HOME/platform-tools

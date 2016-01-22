FROM yongjhih/ubuntu-openjdk-8-android-all

RUN useradd -m -s /bin/bash -u 1001 yongjhih
RUN echo "yongjhih ALL=(ALL)   NOPASSWD: ALL" >> /etc/sudoers

RUN find ${ANDROID_HOME} -type d -exec chmod a+rwx {} \;

USER yongjhih

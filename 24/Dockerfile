FROM yongjhih/android:tools

RUN echo "y" | android update sdk -u -a --filter android-24 && \
    echo "y" | android update sdk -u -a --filter build-tools-24.0.3

ADD docker-entrypoint.sh /
ENTRYPOINT /docker-entrypoint.sh

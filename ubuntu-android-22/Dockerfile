FROM yongjhih/ubuntu-android-21

RUN echo "y" | android update sdk -u -a --filter android-22 && \
    echo "y" | android update sdk -u -a --filter build-tools-22.0.1 && \
    echo "y" | android update sdk -u -a --filter build-tools-22.0.0

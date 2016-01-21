FROM yongjhih/ubuntu-android-extra

RUN echo "y" | android update sdk -u -a --filter android-19 && \
    echo "y" | android update sdk -u -a --filter build-tools-19.1.0 && \
    echo "y" | android update sdk -u -a --filter build-tools-19.0.3 && \
    echo "y" | android update sdk -u -a --filter build-tools-19.0.2 && \
    echo "y" | android update sdk -u -a --filter build-tools-19.0.1

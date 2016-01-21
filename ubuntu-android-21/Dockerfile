FROM yongjhih/ubuntu-android-20

RUN echo "y" | android update sdk -u -a --filter android-21 && \
    echo "y" | android update sdk -u -a --filter build-tools-21.1.2 && \
    echo "y" | android update sdk -u -a --filter build-tools-21.1.1 && \
    echo "y" | android update sdk -u -a --filter build-tools-21.1.0 && \
    echo "y" | android update sdk -u -a --filter build-tools-21.0.2 && \
    echo "y" | android update sdk -u -a --filter build-tools-21.0.1 && \
    echo "y" | android update sdk -u -a --filter build-tools-21.0.0

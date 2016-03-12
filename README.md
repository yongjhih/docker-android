# Docker Android

[![Docker Tag](https://img.shields.io/github/tag/yongjhih/docker-android.svg)](https://hub.docker.com/r/yongjhih/android/tags/)
[![Docker Pulls](https://img.shields.io/docker/pulls/yongjhih/android.svg)](https://hub.docker.com/r/yongjhih/android/)
[![Docker Stars](https://img.shields.io/docker/stars/yongjhih/android.svg)](https://hub.docker.com/r/yongjhih/android/)
[![Docker Size](https://img.shields.io/imagelayers/image-size/yongjhih/android/latest.svg)](https://imagelayers.io/?images=yongjhih/android:latest)
[![Docker Layers](https://img.shields.io/imagelayers/layers/yongjhih/android/latest.svg)](https://imagelayers.io/?images=yongjhih/android:latest)
[![License](https://img.shields.io/github/license/yongjhih/docker-android.svg)](https://github.com/yongjhih/docker-android/raw/master/LICENSE)
[![Gitter Chat](https://img.shields.io/gitter/room/yongjhih/docker-android.svg)](https://gitter.im/yongjhih/docker-android)

![](art/docker-android.png)

## Usage

```sh
wget https://github.com/yongjhih/docker-android/raw/master/docker-android -O ~/bin/docker-android
chmod a+x ~/bin/docker-android
docker-android ./gradlew assembleDebug
```

## Bonus

ubuntu-openjdk-8-android-all:

[![Docker Pulls](https://img.shields.io/docker/pulls/yongjhih/ubuntu-openjdk-8-android-all.svg)](https://hub.docker.com/r/yongjhih/ubuntu-openjdk-8-android-all/)
[![Docker Stars](https://img.shields.io/docker/stars/yongjhih/ubuntu-openjdk-8-android-all.svg)](https://hub.docker.com/r/yongjhih/ubuntu-openjdk-8-android-all/)

ubuntu-jenkins:

[![](https://badge.imagelayers.io/yongjhih/ubuntu-jenkins:latest.svg)](https://imagelayers.io/?images=yongjhih/ubuntu-jenkins:latest)

ubuntu-jenkins-android:

[![](https://badge.imagelayers.io/yongjhih/ubuntu-jenkins-android:latest.svg)](https://imagelayers.io/?images=yongjhih/ubuntu-jenkins-android:latest)

ubuntu-jenkins-android-extra:

[![](https://badge.imagelayers.io/yongjhih/ubuntu-jenkins-android-extra:latest.svg)](https://imagelayers.io/?images=yongjhih/ubuntu-jenkins-android-extra:latest)

ubuntu-jenkins-android-23:

[![](https://badge.imagelayers.io/yongjhih/ubuntu-jenkins-android-23:latest.svg)](https://imagelayers.io/?images=yongjhih/ubuntu-jenkins-android-23:latest)

ubuntu-openjdk-8:

[![](https://badge.imagelayers.io/yongjhih/ubuntu-openjdk-8:latest.svg)](https://imagelayers.io/?images=yongjhih/ubuntu-openjdk-8:latest)

ubuntu-openjdk-8-android:

[![](https://badge.imagelayers.io/yongjhih/ubuntu-openjdk-8-android:latest.svg)](https://imagelayers.io/?images=yongjhih/ubuntu-openjdk-8-android:latest)

ubuntu-openjdk-8-android-extra:

[![](https://badge.imagelayers.io/yongjhih/ubuntu-openjdk-8-android-extra:latest.svg)](https://imagelayers.io/?images=yongjhih/ubuntu-openjdk-8-android-extra:latest)

ubuntu-openjdk-8-android-all:

[![](https://badge.imagelayers.io/yongjhih/ubuntu-openjdk-8-android-all:latest.svg)](https://imagelayers.io/?images=yongjhih/ubuntu-openjdk-8-android-all:latest)

ubuntu-openjdk-8-android-all-jenkins:

[![](https://badge.imagelayers.io/yongjhih/ubuntu-openjdk-8-android-all-jenkins:latest.svg)](https://imagelayers.io/?images=yongjhih/ubuntu-openjdk-8-android-all-jenkins:latest)

### Usage of ubuntu images

jenkins master:

```sh
docker run -d -p 8080:8080 -p 50000:50000 -v /home/jenkins:/var/jenkins_home yongjhih/ubuntu-openjdk-8-android-all-jenkins
```

android dev with 1001 uid:

```sh
docker run -it -v /home/yongjhih/.gradle:/home/yongjhih/.gradle -v /home/yongjhih/works/android:/home/yongjhih/works/android yongjhih/ubuntu-openjdk-8-android-all-1001 bash
```

android dev with other uid:

```dockerfile
FROM yongjhih/ubuntu-openjdk-8-android-all

ENV UID=${UID:-1001}
RUN useradd -m -s /bin/bash -u $UID yongjhih # UID
RUN echo "yongjhih ALL=(ALL)   NOPASSWD: ALL" >> /etc/sudoers

RUN find ${ANDROID_HOME} -type d -exec chmod a+rwx {} \; # Fix **/package.xml (Permission Denied)

USER yongjhih
```

```sh
docker build --fr -t $UID .
docker run -it -v /home/yongjhih/.gradle:/home/yongjhih/.gradle -v /home/yongjhih/works/android:/home/yongjhih/works/android $UID bash
```

## ref.

* https://github.com/jenkinsci/docker#installing-more-tools
* https://github.com/jenkinsci/docker/blob/master/Dockerfile
* http://askubuntu.com/questions/464755/how-to-install-openjdk-8-on-14-04-lts
* https://github.com/picoded/dockerfiles/blob/master/ubuntu-openjdk-8-jdk/Dockerfile

# LICENSE

Apache 2.0, 2015 8tory Inc.

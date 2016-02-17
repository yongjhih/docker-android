# Android Jenkins on Docker

[![](https://badge.imagelayers.io/yongjhih/ubuntu-jenkins:latest.svg)](https://imagelayers.io/?images=yongjhih/ubuntu-jenkins:latest)
[![](https://badge.imagelayers.io/yongjhih/ubuntu-jenkins-android:latest.svg)](https://imagelayers.io/?images=yongjhih/ubuntu-jenkins-android:latest)
[![](https://badge.imagelayers.io/yongjhih/ubuntu-jenkins-android-extra:latest.svg)](https://imagelayers.io/?images=yongjhih/ubuntu-jenkins-android-extra:latest)
[![](https://badge.imagelayers.io/yongjhih/ubuntu-jenkins-android-23:latest.svg)](https://imagelayers.io/?images=yongjhih/ubuntu-jenkins-android-23:latest)

[![](https://badge.imagelayers.io/yongjhih/ubuntu-openjdk-8:latest.svg)](https://imagelayers.io/?images=yongjhih/ubuntu-openjdk-8:latest)
[![](https://badge.imagelayers.io/yongjhih/ubuntu-openjdk-8-android:latest.svg)](https://imagelayers.io/?images=yongjhih/ubuntu-openjdk-8-android:latest)
[![](https://badge.imagelayers.io/yongjhih/ubuntu-openjdk-8-android-extra:latest.svg)](https://imagelayers.io/?images=yongjhih/ubuntu-openjdk-8-android-extra:latest)
[![](https://badge.imagelayers.io/yongjhih/ubuntu-openjdk-8-android-all:latest.svg)](https://imagelayers.io/?images=yongjhih/ubuntu-openjdk-8-android-all:latest)
[![](https://badge.imagelayers.io/yongjhih/ubuntu-openjdk-8-android-all-jenkins:latest.svg)](https://imagelayers.io/?images=yongjhih/ubuntu-openjdk-8-android-all-jenkins:latest)

![](art/docker-android.png)

## Usage

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

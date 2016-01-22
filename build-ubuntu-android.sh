#!/usr/bin/env bash

for i in ubuntu-openjdk-8-android ubuntu-openjdk-8-android-extra ubuntu-openjdk-8-android-all ubuntu-openjdk-8-android-all-jenkins; do
    pushd $i
    docker build --rm -t yongjhih/${i}:latest .
    popd
done

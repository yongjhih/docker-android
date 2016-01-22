#!/usr/bin/env bash

for i in ubuntu-openjdk-8-android ubuntu-openjdk-8-android-extra ubuntu-openjdk-8-android-all; do
    pushd $i
    docker push yongjhih/${i}:latest
    popd
done


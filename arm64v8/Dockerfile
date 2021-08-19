FROM arm64v8/openjdk:11

ENV ANDROID_SDK_ZIP https://dl.google.com/android/repository/commandlinetools-linux-7583922_latest.zip


RUN wget $ANDROID_SDK_ZIP -O /tmp/android-sdk-tools.zip && \
    mkdir -p /opt/android-sdk/cmdline-tools && \
    unzip /tmp/android-sdk-tools.zip -d /opt/android-sdk/cmdline-tools/ && \
    mv /opt/android-sdk/cmdline-tools/cmdline-tools /opt/android-sdk/cmdline-tools/latest && \
    rm /tmp/android-sdk-tools.zip

ENV ANDROID_HOME /opt/android-sdk
ENV ANDROID_SDK $ANDROID_HOME

ENV PATH $PATH:$ANDROID_HOME/cmdline-tools/latest/bin

#  build-tools;29.0.1                                  | 29.0.1       | Android SDK Build-Tools 29.0.1                  | build-tools/29.0.1/
#  build-tools;29.0.2                                  | 29.0.2       | Android SDK Build-Tools 29.0.2                  | build-tools/29.0.2/
#  emulator                                            | 29.2.1       | Android Emulator                                | emulator/
#  platform-tools                                      | 29.0.4       | Android SDK Platform-Tools                      | platform-tools/
#  platforms;android-29                                | 3            | Android SDK Platform 29                         | platforms/android-29/
#  sources;android-29                                  | 1            | Sources for Android 29                          | sources/android-29/
#  system-images;android-29;google_apis;x86            | 8            | Google APIs Intel x86 Atom System Image         | system-images/android-29/google_apis/x86/
#  build-tools;29.0.0                                                                       | 29.0.0       | Android SDK Build-Tools 29
#  build-tools;29.0.1                                                                       | 29.0.1       | Android SDK Build-Tools 29.0.1
#  build-tools;29.0.2                                                                       | 29.0.2       | Android SDK Build-Tools 29.0.2
#  build-tools;29.0.3                                                                       | 29.0.3       | Android SDK Build-Tools 29.0.3
#  platform-tools                                                                           | 29.0.6       | Android SDK Platform-Tools
#  platforms;android-29                                                                     | 4            | Android SDK Platform 29
#  sources;android-29                                                                       | 1            | Sources for Android 29
#  system-images;android-29;default;x86                                                     | 7            | Intel x86 Atom System Image
#  system-images;android-29;default;x86_64                                                  | 7            | Intel x86 Atom_64 System Image
#  system-images;android-29;google_apis;x86                                                 | 9            | Google APIs Intel x86 Atom System Image
#  system-images;android-29;google_apis;x86_64                                              | 9            | Google APIs Intel x86 Atom_64 System Image
#  system-images;android-29;google_apis_playstore;x86                                       | 8            | Google Play Intel x86 Atom System Image
#  system-images;android-29;google_apis_playstore;x86_64                                    | 8            | Google Play Intel x86 Atom_64 System Image
#  emulator                                 | 29.2.1       | 30.0.0
#  platform-tools                           | 29.0.4       | 29.0.6
#  platforms;android-29                     | 3            | 4
#  system-images;android-29;google_apis;x86 | 8            | 9
RUN (echo y; echo y; echo y; echo y; echo y; echo y; echo y) | sdkmanager  --licenses && \
    sdkmanager "platform-tools"       \
               "platforms;android-30" \
               "platforms;android-31" \
               "build-tools;29.0.0" \
               "build-tools;29.0.1" \
               "build-tools;29.0.2" \
               "build-tools;29.0.3" \
               "build-tools;30.0.0" \
               "build-tools;30.0.1" \
               "build-tools;30.0.2" \
               "build-tools;30.0.3" \
               "build-tools;31.0.0"

# We'd not install platform;android-* in this image, because currently build-tools can automatically install the corresponding android platform

RUN chmod -R a+w /android-sdk

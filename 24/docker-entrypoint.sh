#!/usr/bin/env bash
# Android SDK need to update usually except android-24 related
mkdir "$ANDROID_HOME/licenses" || true
echo -e "\n8933bad161af4178b1185d1a37fbf41ea5269c55" > "$ANDROID_HOME/licenses/android-sdk-license"
echo -e "\n84831b9409646a918e30573bab4c9c91346d8abd" > "$ANDROID_HOME/licenses/android-sdk-preview-license"
echo -e "\nd975f751698a77b662f1254ddbeed3901e976f5a" > "$ANDROID_HOME/licenses/intel-android-extra-license"

echo "y" | android update sdk -u -a --filter extra-android-support && \
echo "y" | android update sdk -u -a --filter extra-android-m2repository && \
echo "y" | android update sdk -u -a --filter extra-google-google_play_services && \
echo "y" | android update sdk -u -a --filter extra-google-m2repository && \
echo "y" | android update sdk -u -a --filter extra-google-analytics_sdk_v2
./gradlew dependencies

exec "$@"

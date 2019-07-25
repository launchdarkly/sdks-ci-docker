#!/bin/sh

set -ev

XAMARIN_ANDROID_BUILD_URL=https://jenkins.mono-project.com/view/Xamarin.Android/job/xamarin-android-linux/lastSuccessfulBuild/Azure/processDownloadRequest/xamarin-android/xamarin.android-oss_v9.2.99.172_Linux-x86_64_master_d33bbd8e-Release.tar.bz2
XAMARIN_ANDROID_BUILD_ARTIFACTS_DIR=xamarin.android-oss_v9.2.99.172_Linux-x86_64_master_d33bbd8e-Release
XAMARIN_ANDROID_TOOLS_DIR=xamarin-android
XAMARIN_ANDROID_TOOLS_ARCHIVE=$XAMARIN_ANDROID_TOOLS_DIR.tar.bz2

# Note that the repository for Mono packages is currently pinned to 5.20.1.19 because later versions
# don't work with the current Xamarin Android framework.

sdkmanager "system-images;android-24;default;armeabi-v7a" || true
sdkmanager --licenses

sudo apt -y install apt-transport-https dirmngr gnupg ca-certificates
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/debian stable-stretch/snapshots/5.20.1.19 main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt update
sudo apt -y install mono-devel nuget libzip4 libpulse0

# All of the above packages are required for building, except libpulse0 which is only needed for the Android emulator.

# Download the Xamarin Android tools. Unfortunately the only way to get them for Linux is either to build them ourselves,
# or to download the build products from this Jenkins job.

wget --progress=dot $XAMARIN_ANDROID_BUILD_URL -O ./$XAMARIN_ANDROID_TOOLS_ARCHIVE

sudo chown circleci:circleci $XAMARIN_ANDROID_TOOLS_ARCHIVE
tar xjf $XAMARIN_ANDROID_TOOLS_ARCHIVE
rm $XAMARIN_ANDROID_TOOLS_ARCHIVE
mv $XAMARIN_ANDROID_BUILD_ARTIFACTS_DIR $XAMARIN_ANDROID_TOOLS_DIR

# Move the Xamarin Android tools to the locations where msbuild expects them to be.

sudo mkdir /usr/lib/xamarin.android && sudo mkdir /usr/lib/mono/xbuild/Xamarin/
sudo cp -a $XAMARIN_ANDROID_TOOLS_DIR/bin/Debug/lib/xamarin.android/. /usr/lib/xamarin.android/
rm -rf /usr/lib/mono/xbuild/Xamarin/Android && rm -rf /usr/lib/mono/xbuild-frameworks/MonoAndroid
sudo ln -s /usr/lib/xamarin.android/xbuild/Xamarin/Android/ /usr/lib/mono/xbuild/Xamarin/Android
sudo ln -s /usr/lib/xamarin.android/xbuild-frameworks/MonoAndroid/ /usr/lib/mono/xbuild-frameworks/MonoAndroid

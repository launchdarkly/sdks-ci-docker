FROM circleci/android:api-27

RUN sdkmanager "system-images;android-24;default;armeabi-v7a" || true
RUN sdkmanager --licenses

RUN sudo apt -y install apt-transport-https dirmngr gnupg ca-certificates
RUN sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

# Add repository for Mono packages - currently pinned to 5.20.1.19 because later versions don't work with Xamarin Android.

RUN echo "deb https://download.mono-project.com/repo/debian stable-stretch/snapshots/5.20.1.19 main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list && sudo apt update
RUN sudo apt -y install mono-devel nuget libzip4 libpulse0
# Note, libpulse0 is needed in order to run the Android emulator

# Download the Xamarin Android tools. Unfortunately the only way to get them for Linux is either to build them ourselves,
# or to download the build products from this Jenkins job.

WORKDIR /home/circleci

ADD https://jenkins.mono-project.com/view/Xamarin.Android/job/xamarin-android-linux/lastSuccessfulBuild/Azure/processDownloadRequest/xamarin-android/xamarin.android-oss_v9.2.99.172_Linux-x86_64_master_d33bbd8e-Release.tar.bz2 ./xamarin-android.tar.bz2

RUN sudo chown circleci:circleci xamarin-android.tar.bz2 && tar xjf ./xamarin-android.tar.bz2
RUN mv xamarin.android-oss_v9.2.99.172_Linux-x86_64_master_d33bbd8e-Release xamarin-android

# Move the Xamarin Android tools to the locations where msbuild expects them to be.

RUN sudo mkdir /usr/lib/xamarin.android && sudo mkdir /usr/lib/mono/xbuild/Xamarin/
RUN sudo cp -a xamarin-android/bin/Debug/lib/xamarin.android/. /usr/lib/xamarin.android/
RUN rm -rf /usr/lib/mono/xbuild/Xamarin/Android && rm -rf /usr/lib/mono/xbuild-frameworks/MonoAndroid
RUN sudo ln -s /usr/lib/xamarin.android/xbuild/Xamarin/Android/ /usr/lib/mono/xbuild/Xamarin/Android
RUN sudo ln -s /usr/lib/xamarin.android/xbuild-frameworks/MonoAndroid/ /usr/lib/mono/xbuild-frameworks/MonoAndroid

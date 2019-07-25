# ldcircleci/ld-xamarin-android-linux

This image is based on a standard CircleCI Android Linux image, and adds the SDK components, Mono development tools, and Xamarin Android framework. It supports building Xamarin Android projects with `msbuild` and running them in the Android emulator.

The Xamarin Android framework for Linux is officially unsupported and does not have a Debian package or a stable download URL. This image contains a download of the last stable Linux-x86_64 build from the public build server at `jenkins.mono-project.com`.

When building, instead of calling `msbuild` directly, use `~/xamarin-android/bin/xabuild` which takes the same parameters and invokes `msbuild` after setting up some necessary paths and environment variables.

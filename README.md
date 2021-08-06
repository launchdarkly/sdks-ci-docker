# Docker images for LaunchDarkly SDK CI

This project contains build scripts for Docker images used by LaunchDarkly SDK CI builds and releases. These Dockerfiles are publicly accessible because they're referenced in CircleCI configuration files within the open-source SDK repositories.

Tags that start with `ldcircleci/` are specifically for CI testing. Tags that start with `launchdarkly-dev` may also be used in building releases, whether or not that involves a CI host.

Docker images in this repository include:
* [`launchdarkly-dev/php-sdk-release`](./php-sdk-release)
* [`ldcircleci/ld-c-sdk-ubuntu`](./ld-c-sdk-ubuntu)
* [`ldcircleci/ld-xamarin-android-linux`](./ld-xamarin-android-linux)

Older images we no longer use, but that can be found in the Git history of this repository if we ever need to reconstruct them:
* `ldcircleci/ld-jdk7-jdk8`
* `ldcircleci/ld-php-sdk-release`

## Development instructions 

To build and publish an image:

* Make sure the version number at the top of the Dockerfile has been updated if necessary.
* `make login` (provide the credentials for `ldcircleci`)
* `make push-latest`

## Reporting problems or suggestions

Since these images are really part of the build for the SDK projects, please do not submit issues or PRs on this repository; instead, submit them on whatever SDK repository is or would be affected by the problem or suggestion.

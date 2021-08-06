# Docker images for LaunchDarkly SDK CI

This project contains build scripts for Docker images used by LaunchDarkly SDK CI builds and releases. These Dockerfiles are publicly accessible because they're referenced in CircleCI configuration files within the open-source SDK repositories.

Despite the `ldcircleci/` prefix, these images could also be used in release processes that do not use a CI host.

Docker images in this repository include:
* [`ldcircleci/ld-c-sdk-ubuntu`](./ld-c-sdk-ubuntu)
* [`ldcircleci/ld-xamarin-android-linux`](./ld-xamarin-android-linux)
* [`ldcircleci/php-sdk-release`](./php-sdk-release)

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

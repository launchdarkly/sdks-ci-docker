# Docker images for LaunchDarkly SDK CI

This project contains build scripts for Docker images used by LaunchDarkly SDK CI builds. These Dockerfiles are publicly accessible because they're referenced in the CircleCI configuration files within each open-source SDK repository.

Docker images in this repository include:
* [`ld-c-sdk-ubuntu`](./ld-c-sdk-ubuntu)
* [`ld-xamarin-android-linux`](./ld-xamarin-android-linux)

## Development instructions 

To build and publish an image:

* Make sure the version number at the top of the Dockerfile has been updated if necessary.
* `make login` (provide the credentials for `ldcircleci`)
* `make push-latest`

## Reporting problems or suggestions

Since these images are really part of the build for the SDK projects, please do not submit issues or PRs on this repository; instead, submit them on whatever SDK repository is or would be affected by the problem or suggestion.

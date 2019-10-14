# sdks-ci-docker

This project contains build scripts for Docker images used by LaunchDarkly SDK CI builds. These Dockerfiles are publicly accessible because they're referenced in the CircleCI configuration files within each open-source SDK repository.

Docker images in this repository include:
* [`ld-xamarin-android-linux`](./ld-xamarin-android-linux)

## Development instructions 

To build and publish an image:

* Make sure the version number at the top of the Dockerfile has been updated if necessary.
* `make login`
* `make push-latest`

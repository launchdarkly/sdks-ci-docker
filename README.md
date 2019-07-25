# sdks-ci-docker

This project contains build scripts for Docker images used by LaunchDarkly SDK CI builds.

Each subdirectory is for a specific Docker image. To build and publish the image:

* Make sure the version number at the top of the Dockerfile has been updated if necessary.
* `make login`
* `make push-latest`

# sdks-ci-docker

This project contains build scripts for Docker images used by LaunchDarkly SDK CI builds.

Each subdirectory is for a specific Docker image. To build and publish the image, make sure `IMAGE_VERSION` has been updated if necessary and run `make push-latest`.
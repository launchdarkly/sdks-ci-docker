
# This version should be incremented with every material change
IMAGE_VERSION=1

VERSION=$(IMAGE_VERSION)

DOCKER_TAG_BASE="ldcircleci/ld-xamarin-android-linux"
DOCKER_TAG=$(DOCKER_TAG_BASE):$(VERSION)
DOCKER_TAG_LATEST=$(DOCKER_TAG_BASE):latest

push-latest: push
	docker tag $(DOCKER_TAG) $(DOCKER_TAG_LATEST)
	docker push $(DOCKER_TAG_LATEST)

push: build login
	docker push $(DOCKER_TAG)

build:
	docker build -t $(DOCKER_TAG) .

echo-tag:
	$(DOCKER_TAG)

login:
	docker login

.PHONY: build echo-tag login push-all push-latest

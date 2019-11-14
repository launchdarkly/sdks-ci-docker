
# Use this base makefile when we only need to publish one image and don't need to do any special
# download/config steps that can't be handled in the Dockerfile

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
	echo "$(DOCKER_TAG)"

login:
	docker login

.PHONY: build echo-tag login push push-latest

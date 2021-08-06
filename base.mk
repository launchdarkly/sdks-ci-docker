
# Use this base makefile when we only need to publish one image and don't need to do any special
# download/config steps that can't be handled in the Dockerfile

DOCKER_TAG=$(DOCKER_TAG_BASE):$(VERSION)
DOCKER_TAG_LATEST=$(DOCKER_TAG_BASE):latest

# If applicable, set LOCAL_DEPENDENCIES in the individual project's Makefile to the paths of any
# content that must be built locally by the Makefile before running Docker
# LOCAL_DEPENDENCIES=my-downloaded-file.zip

build: $(LOCAL_DEPENDENCIES)
	docker build -t $(DOCKER_TAG) .

push-latest: push
	docker tag $(DOCKER_TAG) $(DOCKER_TAG_LATEST)
	docker push $(DOCKER_TAG_LATEST)

push: build login
	docker push $(DOCKER_TAG)

echo-tag:
	echo "$(DOCKER_TAG)"

login:
	docker login -u ldcircleci

clean:
	rm -rf downloads

.PHONY: build echo-tag login push push-latest clean

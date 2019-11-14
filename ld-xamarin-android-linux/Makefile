
# This version should be incremented with every material change
VERSION=1

DOCKER_TAG_BASE="ldcircleci/ld-xamarin-android-linux"
DOCKER_TAG=$(DOCKER_TAG_BASE):api$(API_VERSION)-$(VERSION)
DOCKER_TAG_LATEST=$(DOCKER_TAG_BASE):api$(API_VERSION)

ALL_API_VERSIONS=27 28

XAMARIN_ANDROID_BUILD_URL=https://jenkins.mono-project.com/view/Xamarin.Android/job/xamarin-android-linux/lastSuccessfulBuild/Azure/processDownloadRequest/xamarin-android/xamarin.android-oss_v9.2.99.172_Linux-x86_64_master_d33bbd8e-Release.tar.bz2
XAMARIN_ANDROID_ARCHIVE=downloads/xamarin-android.tar.bz2

build-all:
	for v in $(ALL_API_VERSIONS); do $(MAKE) build API_VERSION=$$v; done

push-latest: push
	docker tag $(DOCKER_TAG) $(DOCKER_TAG_LATEST)
	docker push $(DOCKER_TAG_LATEST)

push-latest-all:
	for v in $(ALL_API_VERSIONS); do $(MAKE) push-latest API_VERSION=$$v; done

push: build login
	docker push $(DOCKER_TAG)

push-all:
	for v in $(ALL_API_VERSIONS); do $(MAKE) push API_VERSION=$$v; done

build: $(XAMARIN_ANDROID_ARCHIVE)
	docker build --build-arg API_VERSION=$(API_VERSION) -t $(DOCKER_TAG) .

echo-tag:
	@echo $(DOCKER_TAG)

echo-tag-all:
	@for v in $(ALL_API_VERSIONS); do $(MAKE) echo-tag API_VERSION=$$v; done

$(XAMARIN_ANDROID_ARCHIVE):
	mkdir -p downloads
	wget $(XAMARIN_ANDROID_BUILD_URL) -O $(XAMARIN_ANDROID_ARCHIVE)

login:
	docker login

.PHONY: build build-all echo-tag echo-tag-all login push push-all push-latest push-latest-all

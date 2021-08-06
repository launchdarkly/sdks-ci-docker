
# This version should be incremented with every material change
VERSION=1

DOCKER_TAG_BASE="launchdarkly-dev/php-sdk-release"

PHPDOCUMENTOR_DOWNLOAD_URL=https://phpdoc.org/phpDocumentor.phar

DOWNLOADED_ARCHIVE=$(shell pwd)/downloads/phpDocumentor.phar
LOCAL_DEPENDENCIES=$(DOWNLOADED_ARCHIVE)

include ../base.mk

$(DOWNLOADED_ARCHIVE):
	@mkdir -p downloads
	@curl --fail -L -s $(PHPDOCUMENTOR_DOWNLOAD_URL) > $(DOWNLOADED_ARCHIVE)

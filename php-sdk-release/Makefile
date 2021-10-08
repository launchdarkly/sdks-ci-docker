
# This version should be incremented with every material change
VERSION=2

DOCKER_TAG_BASE="ldcircleci/php-sdk-release"

COMPOSER_VERSION=2.1.9
COMPOSER_DOWNLOAD_URL=https://getcomposer.org/download/$(COMPOSER_VERSION)/composer.phar
# See https://getcomposer.org/download/
COMPOSER_SHA256=4d00b70e146c17d663ad2f9a21ebb4c9d52b021b1ac15f648b4d371c04d648ba
COMPOSER_ARCHIVE=$(shell pwd)/downloads/composer

PHPDOCUMENTOR_VERSION=3.1.2
PHPDOCUMENTOR_DOWNLOAD_URL=https://github.com/phpDocumentor/phpDocumentor/releases/download/v$(PHPDOCUMENTOR_VERSION)/phpDocumentor.phar
PHPDOCUMENTOR_ARCHIVE=$(shell pwd)/downloads/phpdoc

LOCAL_DEPENDENCIES=$(COMPOSER_ARCHIVE) $(PHPDOCUMENTOR_ARCHIVE)

include ../base.mk

$(COMPOSER_ARCHIVE):
	@mkdir -p downloads
	curl --fail -L -s $(COMPOSER_DOWNLOAD_URL) > $(COMPOSER_ARCHIVE)
	echo "${COMPOSER_SHA256} $(COMPOSER_ARCHIVE)" | sha256sum --check
	chmod a+x $(COMPOSER_ARCHIVE)

$(PHPDOCUMENTOR_ARCHIVE):
	@mkdir -p downloads
	curl --fail -L -s $(PHPDOCUMENTOR_DOWNLOAD_URL) > $(PHPDOCUMENTOR_ARCHIVE)
	chmod a+x $(PHPDOCUMENTOR_ARCHIVE)

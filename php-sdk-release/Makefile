# This version should be incremented with every material change
VERSION=5

DOCKER_TAG_BASE="ldcircleci/php-sdk-release"

COMPOSER_VERSION=2.6.5
COMPOSER_DOWNLOAD_URL=https://getcomposer.org/download/$(COMPOSER_VERSION)/composer.phar
# See https://getcomposer.org/download/
COMPOSER_SHA256=9a18e1a3aadbcb94c1bafd6c4a98ff931f4b43a456ef48575130466e19f05dd6
COMPOSER_ARCHIVE=$(shell pwd)/downloads/composer

PHPDOCUMENTOR_VERSION=3.3.1
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

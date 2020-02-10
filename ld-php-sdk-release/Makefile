
# This version should be incremented with every material change
VERSION=1

DOCKER_TAG_BASE="ldcircleci/ld-php-sdk-release"

# This is a temporary download URL from the phpDocumentor project's CI - once there's a stable
# build of phpDocumentor 3, this will be replaced by a stable download URL.
#
# Note that the GitHub API for downloading CI artifacts does not support authentication by SSH
# key. Therefore, this script will ask you interactively for your GitHub credentials.
PHPDOCUMENTOR_DOWNLOAD_URL=https://api.github.com/repos/phpDocumentor/phpDocumentor/actions/artifacts/1690972/zip

PHPDOCUMENTOR_ARCHIVE_FILE=phpDocumentor.phar

LOCAL_DEPENDENCIES=$(shell pwd)/downloads/$(PHPDOCUMENTOR_ARCHIVE_FILE)
DOWNLOADED_ARCHIVE=$(shell pwd)/downloads/phpDocumentor.phar.zip

include ../base.mk

$(LOCAL_DEPENDENCIES):
	@mkdir -p downloads
	@echo "GitHub username for download:" && read gituser && curl --fail -L -u $$gituser -v $(PHPDOCUMENTOR_DOWNLOAD_URL) > $(DOWNLOADED_ARCHIVE)
	@cd downloads && unzip $(DOWNLOADED_ARCHIVE)


# This version should be incremented with every material change
VERSION=1

DOCKER_TAG_BASE="ldcircleci/dotnet5-release"

DOCFX_VERSION_TAG=v2.57.2
DOCFX_DOWNLOAD_URL=https://github.com/dotnet/docfx/releases/download/$(DOCFX_VERSION_TAG)/docfx.zip

SIGNCODE_DOWNLOAD_URL=https://github.com/mtrojnar/osslsigncode/releases/download/2.1/osslsigncode-2.1.0.tar.gz

DOWNLOADS_DIR=$(shell pwd)/downloads
DOCFX_DIR=$(DOWNLOADS_DIR)/docfx
DOCFX_ARCHIVE=$(shell pwd)/downloads/docfx.zip
DOCFX_COMMAND=$(DOCFX_DIR)/docfx
SIGNCODE_DIR=$(DOWNLOADS_DIR)/signcode
SIGNCODE_ARCHIVE=$(shell pwd)/downloads/osslsigncode-2.1.0.tar.gz
LOCAL_DEPENDENCIES=$(DOCFX_DIR) $(SIGNCODE_DIR)

include ../base.mk

$(DOCFX_DIR): $(DOCFX_ARCHIVE) $(DOCFX_COMMAND)
	cd $(DOCFX_DIR) && unzip $(DOCFX_ARCHIVE)

$(DOCFX_ARCHIVE):
	mkdir -p $(DOWNLOADS_DIR)
	curl --fail -L $(DOCFX_DOWNLOAD_URL) >$(DOCFX_ARCHIVE)

# The docfx.exe that's provided in the current docfx distribution is a Mono
# assembly, not a standalone executable. So we'll create a docfx command
# to run it.
$(DOCFX_COMMAND):
	rm -rf $(DOCFX_DIR) && mkdir -p $(DOCFX_DIR)
	echo >$(DOCFX_COMMAND) "#!/bin/bash"
	echo >>$(DOCFX_COMMAND) "mono \$$(dirname \$$0)/docfx.exe \$$@"
	chmod a+x $(DOCFX_COMMAND)

$(SIGNCODE_DIR): $(SIGNCODE_ARCHIVE)
	rm -rf $(SIGNCODE_DIR) && mkdir -p $(SIGNCODE_DIR)
	cd $(SIGNCODE_DIR) && tar xfz $(SIGNCODE_ARCHIVE)

$(SIGNCODE_ARCHIVE):
	mkdir -p $(DOWNLOADS_DIR)
	curl --fail -L $(SIGNCODE_DOWNLOAD_URL) >$(SIGNCODE_ARCHIVE)

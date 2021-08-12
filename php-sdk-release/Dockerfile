FROM php:7.3-cli

# zip may be needed as part of our documentation build process
RUN apt-get -q update && apt-get -y install zip

WORKDIR /home

ENV PHPDOCUMENTOR_ARCHIVE_FILE=phpDocumentor.phar

ENV LDTOOLS_DIR=/home/launchdarkly/tools

RUN mkdir -p ${LDTOOLS_DIR}

ADD downloads/${PHPDOCUMENTOR_ARCHIVE_FILE} ${LDTOOLS_DIR}/php/${PHPDOCUMENTOR_ARCHIVE_FILE}

# Here we're overriding CMD to a shell because the php:7.3-cli image sets CMD to the
# PHP interpreter-- which could be convenient if you wanted to just use the image to
# run a single PHP command, but that's not really what our build image is for.
CMD /bin/bash

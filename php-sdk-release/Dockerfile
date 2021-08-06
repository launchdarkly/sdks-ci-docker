FROM php:7.3-cli

WORKDIR /home

ENV PHPDOCUMENTOR_ARCHIVE_FILE=phpDocumentor.phar

ENV LDTOOLS_DIR=/home/launchdarkly/tools

RUN mkdir -p ${LDTOOLS_DIR}

ADD downloads/${PHPDOCUMENTOR_ARCHIVE_FILE} ${LDTOOLS_DIR}/php/${PHPDOCUMENTOR_ARCHIVE_FILE}

CMD /bin/bash

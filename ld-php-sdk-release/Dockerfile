FROM circleci/php:7.2
# phpDocumentor requires PHP >= 7.2

WORKDIR /home/circleci

ENV PHPDOCUMENTOR_ARCHIVE_FILE=phpDocumentor.phar

ENV LDTOOLS_DIR=/home/circleci/ldtools

RUN mkdir -p ${LDTOOLS_DIR}

ADD downloads/${PHPDOCUMENTOR_ARCHIVE_FILE} ${LDTOOLS_DIR}

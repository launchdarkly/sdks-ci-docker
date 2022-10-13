FROM php:8.0-cli

# zip may be needed as part of our documentation build process
RUN apt-get -q update && apt-get -y install zip

WORKDIR /home

ENV PHP_TOOLS_DIR=/home/launchdarkly/tools/php
ENV PATH="${PATH}:${PHP_TOOLS_DIR}"

RUN mkdir -p ${PHP_TOOLS_DIR}

COPY downloads/composer ${PHP_TOOLS_DIR}
COPY downloads/phpdoc ${PHP_TOOLS_DIR}

# Here we're overriding CMD to a shell because the php:8.0-cli image sets CMD to the
# PHP interpreter-- which could be convenient if you wanted to just use the image to
# run a single PHP command, but that's not really what our build image is for.
CMD /bin/bash

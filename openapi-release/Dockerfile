FROM ubuntu:20.04

RUN groupadd -r releaser && useradd --no-log-init -rm -g releaser -s /bin/bash releaser

RUN apt -q update -y

ENV DEBIAN_FRONTEND=noninteractive
RUN apt -q install -y curl git jq sudo unzip

# Go
RUN curl -s https://dl.google.com/go/go1.15.5.linux-amd64.tar.gz | tar -xz -C /usr/local
ENV PATH="/usr/local/go/bin:${PATH}"

# Java and Gradle
RUN apt -q install -y openjdk-11-jdk

ENV GRADLE_VERSION=6.8.3 \
	PATH=/opt/gradle/bin:$PATH
RUN curl -sSL --fail --retry 3 "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip" >gradle.zip && \
	unzip -d /opt gradle.zip && \
	rm gradle.zip && \
	sudo ln -s /opt/gradle-* /opt/gradle && \
	gradle --version

# Node, NPM, Yarn
RUN apt -q install -y nodejs npm
RUN npm install --global yarn

# Python
RUN apt -q install -y python3 python3-pip
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1
RUN update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1
RUN pip install bravado  # used in validating the OpenAPI spec
RUN pip install twine  # for releasing to PyPI

# Ruby
RUN apt -q install -y ruby
RUN mkdir -p /home/releaser/.rubygems
ENV GEM_HOME="/home/releaser/.rubygems/"
ENV PATH="$PATH:/home/releaser/.rubygems/bin"

# Make sure files in home dir are owned by default user
RUN chown -R releaser:releaser /home/releaser

# Allow the default user to use sudo, so new packages can be installed during a release if necessary
RUN usermod -aG sudo releaser

USER releaser

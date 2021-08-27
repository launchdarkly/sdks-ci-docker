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

# Docker (because the OpenAPI release runs the code generator in a secondary Docker container)
RUN apt -q install -y apt-transport-https ca-certificates gnupg lsb-release
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
	gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt -q update
RUN apt -q install -y docker-ce docker-ce-cli containerd.io

# Make sure files in home dir are owned by default user
RUN chown -R releaser:releaser /home/releaser

# Allow the default user to use sudo, so new packages can be installed during a release if necessary
RUN usermod -aG sudo releaser

USER releaser

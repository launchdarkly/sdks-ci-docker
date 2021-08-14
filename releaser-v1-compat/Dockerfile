FROM ubuntu:20.04

RUN groupadd -r releaser && useradd --no-log-init -rm -g releaser -s /bin/bash releaser

# This time zone hack avoids a region prompt that some packages, like awscli, would otherwise try
# to do interactively when they're installed. See:
# https://unix.stackexchange.com/questions/433942/how-to-specify-extra-tz-info-for-apt-get-install-y-awscli
RUN ln -snf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime && echo "America/Los_Angeles" >>/etc/timezone

RUN apt -q update -y

RUN apt -q install -y curl git

# Go
RUN curl -s https://dl.google.com/go/go1.15.5.linux-amd64.tar.gz | tar -xz -C /usr/local
ENV PATH="/usr/local/go/bin:${PATH}"

# Java
RUN apt -q install -y openjdk-8-jdk

# Node
RUN apt -q install -y nodejs npm

# Python
RUN apt -q install -y python3 python3-pip
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1
RUN update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1
RUN pip install twine

# Ruby
RUN apt -q install -y ruby
RUN mkdir -p /home/releaser/.rubygems
ENV GEM_HOME="/home/releaser/.rubygems/"
ENV PATH="$PATH:/home/releaser/.rubygems/bin"

# AWS
RUN apt -q install -y awscli

RUN chown -R releaser:releaser /home/releaser

USER releaser

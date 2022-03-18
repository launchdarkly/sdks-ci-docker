FROM ubuntu:20.04 as builder

# Install prerequisites for osslsigncode
RUN apt-get -q update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install \
  wget unzip build-essential pkg-config libssl-dev libcurl4-openssl-dev

ARG DOCFX_DOWNLOAD_URL
ARG DOCFX_ARCHIVE_NAME

# Download and unzip DocFX and create a command alias
RUN cd /tmp && wget $DOCFX_DOWNLOAD_URL
RUN mkdir /root/docfx && cd /root/docfx && unzip /tmp/$DOCFX_ARCHIVE_NAME
RUN echo >/root/docfx/docfx '#!/bin/sh' && echo >>/root/docfx/docfx 'mono /root/docfx/docfx.exe $@' && chmod a+x /root/docfx/docfx

ARG OSSLSIGNCODE_DOWNLOAD_URL
ARG OSSLSIGNCODE_ARCHIVE_NAME
ARG OSSLSIGNCODE_VERSION

# Download and unzip osslsigncode
RUN cd /tmp && wget $OSSLSIGNCODE_DOWNLOAD_URL
RUN mkdir /tmp/buildsigncode && cd /tmp/buildsigncode && tar xfz /tmp/$OSSLSIGNCODE_ARCHIVE_NAME

# Build osslsigncode
RUN cd /tmp/buildsigncode && cd $(ls) && ./configure && make && cp osslsigncode /tmp/buildsigncode


FROM mcr.microsoft.com/dotnet/sdk:6.0-focal

# Install Mono - see https://www.mono-project.com/download/stable
# We need Mono because DocFX 2.x can't use the .NET Core runtime.
RUN apt-get update
RUN apt-get install -y gnupg ca-certificates
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | tee /etc/apt/sources.list.d/mono-official-stable.list
RUN apt-get update
RUN apt-get install -y mono-devel

# Copy docfx and add it to PATH
RUN mkdir /root/docfx
COPY --from=builder /root/docfx /root/docfx/
ENV PATH="${PATH}:/root/docfx"

# Copy osslsigncode which we built in the previous image
RUN mkdir /root/signcode
COPY --from=builder /tmp/buildsigncode/osslsigncode /root/signcode/
ENV PATH="${PATH}:/root/signcode"

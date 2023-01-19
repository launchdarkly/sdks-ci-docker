FROM ubuntu:20.04 as builder

# Install prerequisites for osslsigncode
RUN apt-get -q update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install \
  wget unzip build-essential pkg-config libssl-dev libcurl4-openssl-dev

ARG OSSLSIGNCODE_DOWNLOAD_URL
ARG OSSLSIGNCODE_ARCHIVE_NAME
ARG OSSLSIGNCODE_VERSION

# Download and unzip osslsigncode
RUN cd /tmp && wget $OSSLSIGNCODE_DOWNLOAD_URL
RUN mkdir /tmp/buildsigncode && cd /tmp/buildsigncode && tar xfz /tmp/$OSSLSIGNCODE_ARCHIVE_NAME

# Build osslsigncode
RUN cd /tmp/buildsigncode && cd $(ls) && ./configure && make && cp osslsigncode /tmp/buildsigncode


FROM mcr.microsoft.com/dotnet/sdk:6.0-focal

ARG DOCFX_VERSION

# Install docfx
RUN dotnet tool install docfx --global --version $DOCFX_VERSION

# Copy osslsigncode which we built in the previous image
RUN mkdir /root/signcode
COPY --from=builder /tmp/buildsigncode/osslsigncode /root/signcode/
ENV PATH="${PATH}:/root/signcode"

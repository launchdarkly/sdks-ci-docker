FROM ubuntu:20.04

WORKDIR /home/circleci

# Basic C SDK dependencies: libcurl4-openssl-dev
# Server-side C SDK dependencies: libpcre3-dev
# Make-based build: build-essential
# Cmake-based build: cmake
# For cloning googletest code: git
# Documentation build: doxygen zip
# Testing: valgrind

# This is needed otherwise docker build will hang while Ubuntu asks us to select a timezone.
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get install -y \
  libcurl4-openssl-dev \
  libpcre3-dev \
  libhiredis-dev \
  build-essential \
  doxygen \
  git \
  zip \
  valgrind \
  wget

RUN wget -qO- "https://cmake.org/files/v3.22/cmake-3.22.1-linux-x86_64.tar.gz" | tar --strip-components=1 -xz -C /usr/local

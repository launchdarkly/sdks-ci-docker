FROM ubuntu:18.04

WORKDIR /home/circleci

# Basic C SDK dependencies: libcurl4-openssl-dev
# Server-side C SDK dependencies: libpcre3-dev
# Make-based build: build-essential
# Cmake-based build: cmake
# For cloning googletest code: git
# Documentation build: doxygen zip
# Testing: valgrind

RUN apt-get update -y && apt-get install -y \
  libcurl4-openssl-dev \
  libpcre3-dev \
  libhiredis-dev \
  build-essential \
  cmake \
  doxygen \
  git \
  zip \
  valgrind

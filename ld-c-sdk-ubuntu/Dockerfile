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

RUN codename=$(cat /etc/os-release | grep UBUNTU_CODENAME | sed -e "s/^UBUNTU_CODENAME=//") \
    && wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | tee /usr/share/keyrings/kitware-archive-keyring.gpg >/dev/null \
    && echo "deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ ${codename} main" | tee /etc/apt/sources.list.d/kitware.list >/dev/null \
    && apt purge --auto-remove cmake \
    && apt-get update -y \
    && apt-get install -y cmake



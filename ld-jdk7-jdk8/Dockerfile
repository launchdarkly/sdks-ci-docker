FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y openjdk-7-jdk software-properties-common
RUN add-apt-repository -y ppa:openjdk-r/ppa && apt-get update
RUN apt-get install -y openjdk-8-jdk

ENV JDK7_HOME=/usr/lib/jvm/java-7-openjdk-amd64
ENV JDK8_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

RUN update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

FROM ubuntu:20.04 as builder

# Install prerequisites for osssigncode
RUN apt-get -q update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install \
	build-essential pkg-config libssl-dev libcurl4-openssl-dev

# Build osssigncode (source distribution already downloaded and unzipped by Makefile)
COPY ./downloads/signcode /root/buildsigncode
RUN cd /root/buildsigncode && cd $(ls) && ./configure && make && cp osslsigncode /root


FROM mcr.microsoft.com/dotnet/sdk:5.0-focal

# Install Mono - see https://www.mono-project.com/download/stable
RUN apt-get update
RUN apt-get install -y gnupg ca-certificates
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | tee /etc/apt/sources.list.d/mono-official-stable.list
RUN apt-get update
RUN apt-get install -y mono-devel

# Copy docfx (already downloaded and unzipped by Makefile)
COPY ./downloads/docfx /root/docfx
ENV PATH="${PATH}:/root/docfx"

# Copy osslsigncode which we built in the previous image
RUN mkdir /root/signcode
COPY --from=builder /root/osslsigncode /root/signcode/
ENV PATH="${PATH}:/root/signcode"

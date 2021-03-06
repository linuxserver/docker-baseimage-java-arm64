FROM lsiobase/ubuntu.arm64:bionic

# this image is primarily for XXXsonic downstream apps
# with the inclusion of ffmpeg it may be to heavy for some java apps that do not require it.

# environment settings
ARG DEBIAN_FRONTEND="noninteractive"
ENV LANG="C.UTF-8"

RUN \
 echo "**** install runtime packages ****" && \
 apt-get update && \
 apt-get install -y \
	--no-install-recommends \
	ca-certificates \
	ffmpeg \
	flac \
	fontconfig \
	lame \
	openjdk-8-jre-headless \
	ttf-dejavu && \
 echo "**** fix XXXsonic status page ****" && \
 find /etc -name "accessibility.properties" -exec rm -fv '{}' + && \
 find /usr -name "accessibility.properties" -exec rm -fv '{}' + && \
 echo "**** cleanup ****" && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

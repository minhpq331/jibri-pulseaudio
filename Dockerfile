ARG BASE_IMAGE=jitsi/jibri
ARG BASE_TAG=latest
FROM ${BASE_IMAGE}:${BASE_TAG}

RUN \
	apt-dpkg-wrap apt-get update \
	&& apt-dpkg-wrap apt-get install -y pulseaudio dbus dbus-x11 rtkit unzip \
	&& apt-cleanup \
	&& curl https://rclone.org/install.sh | bash

RUN adduser jibri rtkit

COPY docker/files/ /

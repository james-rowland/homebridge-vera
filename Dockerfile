FROM lsiobase/alpine
MAINTAINER jrowland

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# package version
ARG DAAPD_VER="24.2"

# install runtime packages
RUN \
 apk add --no-cache \
	avahi \
	confuse \
	dbus \
	json-c \
	libcurl \
	libevent \
	libgcrypt \
	libplist \
	libunistring \
	protobuf-c && \
 apk add --no-cache \
 --repository http://nl.alpinelinux.org/alpine/edge/testing \
	libantlr3c \
	#python \
	mxml && \
 apk add --no-cache \
  nodejs && \

# install build packages
 apk add --no-cache --virtual=build-dependencies \
	alpine-sdk \
	alsa-lib-dev \
	autoconf \
	automake \
	avahi-dev \
	bash \
	binutils-gold \
	bsd-compat-headers \
	confuse-dev \
	curl \
	curl-dev \
	file \
	g++ \
	#gcc \
	gettext-dev \
	gnupg \
	gnutls-dev \
	gperf \
	json-c-dev \
	libcurl \
	libevent-dev \
	libgcrypt-dev \
	libgcc \
	libogg-dev \
	libplist-dev \
	libstdc++ \
	libtool \
	libunistring-dev \
	linux-headers \
	make \
	#paxctl \
	protobuf-c-dev \
	taglib-dev \
	tar && \
 apk add --no-cache --virtual=build-dependencies2 \
	--repository http://nl.alpinelinux.org/alpine/edge/testing \
	libantlr3c-dev \
	mxml-dev

#RUN node --version
RUN npm install -g node-gyp
RUN npm install -g homebridge
RUN npm install -g homebridge-vera
RUN npm install -g homebridge-yamaha

# cleanup
#RUN \
# apk del --purge \
#	build-dependencies \
#	build-dependencies2 && \
# rm -rf \
#	/tmp/*

# copy local files
COPY root/ /
COPY config.json /root/.homebridge/

# ports and volumes
VOLUME /config

EXPOSE 51826

FROM debian:jessie

MAINTAINER Justin Cormack <justin@specialbusservice.com>

RUN \
  apt-get update && \
  apt-get upgrade

RUN \
  apt-get install -y \
  build-essential \
  gawk \
  tar \
  grep \
  gzip \
  sed \
  zlib1g-dev \
  openssl \
  ncurses-dev \
  file \
  wget \
  curl \
  git \
  rsync \
  m4 \
  python-pexpect \
  bash \
  vim \
  rsync

RUN \
  cd /usr && \
  git clone https://github.com/jsonn/pkgsrc.git 

ENV \
  PATH=/usr/pkg/bin:$PATH \
  NOGCCERROR=yes \
  PKG_DEFAULT_OPTIONS="-gssapi" \
  LIBABISUFFIX="" \
  SH=/bin/bash

RUN \
  cd /usr/pkgsrc/bootstrap && ./bootstrap

COPY mk.conf /usr/pkg/etc/

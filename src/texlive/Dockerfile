FROM mcr.microsoft.com/devcontainers/base:1-ubuntu-24.04

ARG TEXLIVE_VERSION

COPY install_texlive.sh /tmp/

RUN \
  TEXLIVE_VERSION=${TEXLIVE_VERSION} bash /tmp/install_texlive.sh && \
  rm /tmp/install_texlive.sh && \
  sed -i "s~export PATH=~export PATH=/usr/local/texlive/${TEXLIVE_VERSION}/bin/x86_64-linux:~" /etc/profile.d/00-restore-env.sh

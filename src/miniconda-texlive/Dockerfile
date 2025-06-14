FROM mcr.microsoft.com/devcontainers/miniconda:1-3

ARG TEXLIVE_VERSION

COPY install_texlive.sh /tmp/

RUN \
  TEXLIVE_VERSION=${TEXLIVE_VERSION} bash /tmp/install_texlive.sh && \
  rm /tmp/install_texlive.sh && \
  sed -i "s~export PATH=~export PATH=/usr/local/texlive/${TEXLIVE_VERSION}/bin/x86_64-linux:~" /etc/profile.d/00-restore-env.sh

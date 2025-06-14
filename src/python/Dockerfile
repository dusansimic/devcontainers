FROM mcr.microsoft.com/devcontainers/python:3

COPY install_ruff.sh install_uv.sh /tmp/

RUN \
  bash /tmp/install_ruff.sh && \
  bash /tmp/install_uv.sh

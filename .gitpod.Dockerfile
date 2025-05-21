FROM ghcr.io/gitpod-io/workspace-full-vnc:latest

USER root

RUN apt-get update && apt-get install -y \
    qt6-base-dev \
    qt6-declarative-dev \
    qt6-tools-dev-tools \
    libgl1-mesa-dev \
    qt6-multimedia-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

USER gitpod
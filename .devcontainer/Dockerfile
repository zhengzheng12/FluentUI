 # 基于 Ubuntu 的官方 Dev Container 镜像
FROM mcr.microsoft.com/devcontainers/base:ubuntu

# 安装基本开发工具和 Qt6（含 QML）
RUN apt-get update && \
    apt-get install -y \
        build-essential \
        cmake \
        gdb \
        git \
        qt6-base-dev \
        qt6-declarative-dev \
        qt6-tools-dev-tools \
        qt6-l10n-tools \
        qt6-multimedia-dev \
        libgl1-mesa-dev \
        libxkbcommon-x11-dev \
        libxcb-cursor0 \
        libxcb-xinerama0 \
        libxcb-xinput0 \
        x11-xserver-utils \
        pkg-config && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 使用非 root 用户 vscode（GitHub Codespaces 默认用户）
USER vscode
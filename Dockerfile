FROM lscr.io/linuxserver/code-server:latest

# Set environment variables to run as root
ENV PUID=0 \
    PGID=0 \
    TZ=Etc/UTC \
    PASSWORD=bear299maketry \
    DEFAULT_WORKSPACE=/config/workspace \
    PWA_APPNAME=code-server

USER root

# Update and install system-level packages only (no pip)
RUN apt-get update && apt-get install -y \
    wget \
    build-essential \
    gcc \
    g++ \
    python3 \
    python3-venv \
    python3-dev \
    jupyter \
    cmake \
    gdb \
    make \
    && code-server --install-extension ms-python.python \
    && code-server --install-extension ms-toolsai.jupyter \
    && code-server --install-extension formulahendry.code-runner \
    && code-server --install-extension franneck94.vscode-c-cpp-dev-extension-pack \
    && code-server --install-extension franneck94.c-cpp-runner \
    && code-server --install-extension franneck94.vscode-c-cpp-config \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Expose port
EXPOSE 8443

# Volume for persistent data
VOLUME ["/config"]

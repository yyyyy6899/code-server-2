FROM lscr.io/linuxserver/code-server:latest

# Set environment variables to run as root
ENV PUID=0 \
    PGID=0 \
    TZ=Etc/UTC \
    PASSWORD=bear299maketry \
    DEFAULT_WORKSPACE=/config/workspace \
    PWA_APPNAME=code-server

USER root

# Install only system-level developer tools
RUN apt-get update && apt-get install -y \
    wget \
    build-essential \
    gcc \
    g++ \
    python3 \
    python3-venv \
    python3-dev \
    cmake \
    gdb \
    make \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Expose port
EXPOSE 8443

# Volume for persistent data
VOLUME ["/config"]

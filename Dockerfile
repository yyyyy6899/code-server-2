FROM lscr.io/linuxserver/code-server:latest

# Set environment variables
ENV PUID=0 \
    PGID=0 \
    TZ=Etc/UTC \
    DEFAULT_WORKSPACE=/config/workspace \
    PWA_APPNAME=code-server

USER root

# Install developer tools + GUI packages
RUN apt-get update && apt-get install -y \
    wget \
    build-essential \
    htop \
    nano \
    gcc \
    g++ \
    python3 \
    python3-venv \
    python3-dev \
    cmake \
    gdb \
    make \
    lxappearance \
    breeze-cursor-theme \
    dmz-cursor-theme \
    pcmanfm \
    openbox \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set default VS Code dark theme
RUN mkdir -p /config/data/User && \
    echo '{ \
        "workbench.colorTheme": "Default Dark+", \
        "workbench.startupEditor": "none" \
    }' > /config/data/User/settings.json

# Expose port
EXPOSE 8443

# Persistent volume
VOLUME ["/config"]

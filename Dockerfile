FROM lscr.io/linuxserver/code-server:latest

# Set environment variables to run as root
ENV PUID=1000 \
    PGID=1000 \
    TZ=Etc/UTC \
    PASSWORD=password \
    DEFAULT_WORKSPACE=/config/workspace \
    PWA_APPNAME=code-server

# Remove SUDO_PASSWORD to disable sudo password requirement
# Remove SUDO_PASSWORD_HASH as well

# Expose port
EXPOSE 8443

# Volume for persistent data
VOLUME ["/config"]

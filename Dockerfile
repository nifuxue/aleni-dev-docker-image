FROM ubuntu:jammy

# Environment setup
# VNC port:5901
# noVNC webport, connect via http://IP:6901/?password=vncpassword
ENV DISPLAY=:1 \
    VNC_PORT=5901 \
    NO_VNC_PORT=6901 \
    VNC_RESOLUTION=1920x1080 \
    VNC_PASSWD=mypasswd \
    DEBIAN_FRONTEND=noninteractive

EXPOSE $VNC_PORT $NO_VNC_PORT

### install basics
RUN apt-get update \
    && apt-get install -y \
        vim \
        build-essential \
        wget \
        curl \
        sudo
    # && apt-get clean \
    # && rm -rf /var/lib/apt/lists/*

### install tiger vnc_server
# RUN apt-get install -y \
#         xfce4 xfce4-goodies \
#         tigervnc-standalone-server \
#         tigervnc-common \
#         tigervnc-xorg-extension

### install tight vnc_server
RUN apt-get install -y \
        xfce4 xfce4-goodies \
        tightvncserver





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
        sudo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

### add and set user
RUN useradd -d /home/nifuxue -m nifuxue
RUN bash -c 'echo -e "mypasswd\nmypasswd" | passwd nifuxue'
USER nifuxue
WORKDIR /home/nifuxue

### install vnc_server





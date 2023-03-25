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

### install xfce4, tigervnc
RUN apt-get install -y supervisor xfce4 xfce4-terminal xterm dbus-x11 libdbus-glib-1-2 \
    && apt-get purge -y pm-utils *screensaver*
RUN apt-get install -y tigervnc-standalone-server

### add a user without a passwd, and grant it sudoer's permission
RUN useradd -d /home/nifuxue -m nifuxue \
    && echo "nifuxue ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/nifuxue

### vnc passwd
RUN mkdir -p /home/nifuxue/.vnc \
    && echo "vncpasswd" | vncpasswd -f > /home/nifuxue/.vnc/passwd \
    && chown nifuxue:nifuxue /home/nifuxue/.vnc -R

# ### install firefox

# COPY Scripts/firefox.sh /home/nifuxue/Downloads/
# RUN /home/nifuxue/Downloads/firefox.sh

### entry point 
USER nifuxue
WORKDIR /home/nifuxue

ENTRYPOINT ["vncserver", "-localhost", "no", "-PasswordFile", "/home/nifuxue/.vnc/passwd", "-fg"]






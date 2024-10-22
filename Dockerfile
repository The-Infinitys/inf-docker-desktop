FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade --assume-yes
# get chrome-remote-desktop
RUN curl https://dl.google.com/linux/linux_signing_key.pub \
    | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/chrome-remote-desktop.gpg
RUN echo "deb [arch=amd64] https://dl.google.com/linux/chrome-remote-desktop/deb stable main" \
    | sudo tee /etc/apt/sources.list.d/chrome-remote-desktop.list
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get install --assume-yes chrome-remote-desktop
# install plasma
RUN DEBIAN_FRONTEND=noninteractive \
    apt install --assume-yes  task-kde-desktop
RUN bash -c 'echo "exec /etc/X11/Xsession /usr/bin/startplasma-x11" > /etc/chrome-remote-desktop-session'
# install google-chrome
RUN curl -L -o google-chrome-stable_current_amd64.deb \
https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt install --assume-yes --fix-broken ./google-chrome-stable_current_amd64.deb

# SPECIFY VARIABLES FOR SETTING UP CHROME REMOTE DESKTOP
ARG USER=owner
# Set chrome-remote
ENV PIN=123456
ENV CODE=4/xxx
ENV HOSTNAME=ownvirtual
CMD \
   DISPLAY= /opt/google/chrome-remote-desktop/start-host --code=$CODE --redirect-url="https://remotedesktop.google.com/_/oauthredirect" --name=$HOSTNAME --pin=$PIN ; \
   sudo systemctl status chrome-remote-desktop@$USER ;

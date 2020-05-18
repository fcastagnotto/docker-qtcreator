FROM ubuntu:16.04 as base

ENV DEBIAN_FRONTENV noninteractive

RUN apt-get update && apt-get -y upgrade

# Required Packages for the Host Development System
RUN apt-get install -y gawk wget git-core diffstat unzip texinfo gcc-multilib g++-multilib \
     build-essential chrpath socat cpio python python3 python3-pip python3-pexpect \
     apt-utils tmux xz-utils debianutils iputils-ping libncurses5-dev

# Additional host packages required by poky/scripts/wic
RUN apt-get install -y curl dosfstools mtools parted syslinux tree zip
RUN apt-get install -y vim nano

From base as repoimage
# Add "repo" tool (used by many Yocto-based projects)
RUN curl http://storage.googleapis.com/git-repo-downloads/repo > /usr/local/bin/repo
RUN chmod a+x /usr/local/bin/repo

From repoimage as users
# Create user "jenkins"
RUN id jenkins 2>/dev/null || useradd --uid 1000 --create-home jenkins

# Create a non-root user that will perform the actual build
RUN id build 2>/dev/null || useradd --uid 30000 --create-home build
RUN apt-get install -y sudo
RUN echo "build ALL=(ALL) NOPASSWD: ALL" | tee -a /etc/sudoers

From users as locales
# Fix error "Please use a locale setting which supports utf-8."
# See https://wiki.yoctoproject.org/wiki/TipsAndTricks/ResolvingLocaleIssues
RUN apt-get install -y locales
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
        echo 'LANG="en_US.UTF-8"'>/etc/default/locale && \
        dpkg-reconfigure --frontend=noninteractive locales && \
        update-locale LANG=en_US.UTF-8

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

From locales as yoctosandbox
USER jenkins
WORKDIR /home/jenkins
CMD "/bin/bash"
RUN echo "alias build='cd /yocto/Saet; ./builder.sh'" > /home/jenkins/.bashrc

From yoctosandbox as ubuntuqt
USER root

From ubuntuqt as qtcreator
RUN apt-get update && apt-get install -y libfreetype6-dev libfontconfig libdbus-1-3 libx11-dev libxcb-damage0 libxrender-dev libxkbcommon-x11-dev
RUN apt-get update && apt-get install -y libx11-xcb1 libgl1-mesa-glx libglib2.0-0

From qtcreator as developer

USER jenkins
ENV HOME /home/jenkins

From developer as installer

ENV PATH="/qtcreator/Tools/QtCreator/bin:${PATH}"
RUN cd /
USER jenkins

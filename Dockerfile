FROM debian:jessie
# Add repositories
RUN echo "# add src debian" >> /etc/apt/sources.list
RUN echo "deb-src http://httpredir.debian.org/debian jessie main" >> /etc/apt/sources.list
RUN echo "# add sid debian" >> /etc/apt/sources.list
RUN echo "deb http://httpredir.debian.org/debian sid main" >> /etc/apt/sources.list
RUN echo "deb-src http://httpredir.debian.org/debian sid main" >> /etc/apt/sources.list
# Install packages
RUN apt-get update
# Install perl and sphinx from sid (bugged in jessie)
RUN apt-get -t sid install -y perl
RUN apt-get -t sid install -y python-sphinx=1.4.5-1
# Packaging tools
RUN apt-get install --fix-missing -y build-essential devscripts quilt pbuilder lintian
# For packaging python modules that use setuptools
RUN apt-get install -y python-stdeb
# General tools
RUN apt-get install -y vim git subversion
# Prepare environment
ENV DIST jessie-backports
#RUN pbuilder create

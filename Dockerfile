FROM debian:jessie
# Add repositories
RUN echo "# add src debian" >> /etc/apt/sources.list
RUN echo "deb-src http://httpredir.debian.org/debian jessie main" >> /etc/apt/sources.list
RUN echo "deb http://httpredir.debian.org/debian jessie-backports main" >> /etc/apt/sources.list
RUN echo "# add other src repositories debian" >> /etc/apt/sources.list
#RUN echo "deb http://httpredir.debian.org/debian sid main" >> /etc/apt/sources.list
RUN echo "deb-src http://httpredir.debian.org/debian jessie-backports main" >> /etc/apt/sources.list
RUN echo "deb-src http://httpredir.debian.org/debian testing main" >> /etc/apt/sources.list
RUN echo "deb-src http://httpredir.debian.org/debian sid main" >> /etc/apt/sources.list
RUN echo "deb-src http://httpredir.debian.org/debian experimental main" >> /etc/apt/sources.list
# Set more priority to jessie backport repo
RUN touch  /etc/apt/preferences
RUN echo "Package: *
Pin: release a=jessie-backports
Pin-Priority: 501
" >> /etc/apt/preferences
# Install packages
RUN apt-get update
# Install perl and sphinx from backport (bugged in jessie)
RUN apt-get install -y perl
RUN apt-get install -y python-sphinx
# Packaging tools
RUN apt-get install --fix-missing -y build-essential devscripts quilt pbuilder lintian
# For packaging python modules that use setuptools
RUN apt-get install -y python-stdeb
# General tools
RUN apt-get install -y vim git subversion
# Prepare environment
ENV DIST jessie-backports
#RUN pbuilder create

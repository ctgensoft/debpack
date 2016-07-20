FROM debian:jessie
# Add repositories
RUN echo "# add src debian" >> /etc/apt/sources.list
RUN echo "deb-src http://httpredir.debian.org/debian jessie main" >> /etc/apt/sources.list
RUN echo "# add testing debian" >> /etc/apt/sources.list
RUN echo "deb http://httpredir.debian.org/debian testing main" >> /etc/apt/sources.list
# Install packages
RUN apt-get update
# Install perl from testing (bugged in jessie)
apt-get -t testing install perl
# Packaging tools
RUN apt-get install --fix-missing build-essential devscripts quilt pbuilder lintian
# For packaging python modules that use setuptools
RUN apt-get install python-stdeb
# General tools
RUN apt-get install vim git subversion
# Prepare environment
RUN pbuilder create

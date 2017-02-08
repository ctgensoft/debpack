FROM debian:stretch

# Add extra repos
COPY official_src.list /etc/apt/sources.d/
RUN apt-get update

# Packaging tools
RUN apt-get install --fix-missing -y build-essential devscripts quilt pbuilder lintian pkg-config dh-make
# For packaging python modules that use setuptools
RUN apt-get install -y python-stdeb
# General tools
RUN apt-get install -y vim git subversion ipython
# Prepare environment
ENV DIST jessie-backports
# For quilt (patching tool)
ENV QUILT_PATCHES debian/patches
ENV QUILT_REFRESH_ARGS "-p ab --no-timestamps --no-index"
# For gitlab
ENV GIT_SSL_NO_VERIFY 1
#RUN pbuilder create

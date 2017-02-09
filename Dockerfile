FROM debian:stretch

# Add extra repos
COPY official_src.list /etc/apt/sources.d/

# Install packages
RUN apt-get update && apt-get install --fix-missing -y \
        #general tools
        git \
        ipython \
        vim \
        subversion \
        # packaging tools
        build-essential \
        cowbuilder \
        devscripts \
        dh-make \
        git-buildpackage \
        lintian \
        pbuilder \
        pkg-config \
        python-stdeb \
        quilt

RUN mkdir /packaging

# Set default target distribution for chroot
ENV DIST stretch

# For quilt (patching tool)
ENV QUILT_PATCHES debian/patches
ENV QUILT_REFRESH_ARGS "-p ab --no-timestamps --no-index"

# For gitlab
ENV GIT_SSL_NO_VERIFY 1

# TODO:
#RUN pbuilder create

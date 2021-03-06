FROM debian:stretch

# Add extra repos
COPY official_src.list /etc/apt/sources.list.d/

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

# Configure vim
COPY .vimrc /root/
# Configure quilt
COPY .quiltrc /root/

RUN mkdir /packaging

# Set default target distribution for chroot
ENV DIST stretch

# For gitlab
ENV GIT_SSL_NO_VERIFY 1

# configuration of gbp
COPY gbp.conf /etc/git-buildpackage/

# TODO:
#RUN pbuilder create


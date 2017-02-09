# debpack
Docker Image for Debian packaging.

The standard packaging tools have been installed: build-essential devscripts quilt pbuilder lintian python-stdeb.
The enviroment has been created with pbuilder (pbuilder create).
and the basic tools are installed: git, svn, vi.

# How to run it?
Run it in detached mode and later on execute bash in order to play with it.

~~~~
xhost +local:
docker run -it --privileged=True -e DISPLAY=$DISPLAY -e QT_X11_NO_MITSHM=1 -v /tmp/.X11-unix:/tmp/.X11-unix --name debpack ctgensoft/debpack bash
~~~~

# How to start packaging?

Once you finished your package modifications (add patch(es), update upstream, modify changelog):
~~~~
TODO
~~~~

# debian8-packaging
Image for Debian8 packaging.

The standar packaging tools have been installed: build-essential devscripts quilt pbuilder lintian python-stdeb.
The enviroment has been created with pbuilder (pbuilder create).
and the basic tools are installed: git, svn, vi.

# How to run it?
Run it in detached mode and later on execute bash in order to play with it.

~~~~
docker run -d --privileged=True --name debian8-packaging cmft/debian8-packaging
docker exec -it debian8-packaging  bash
~~~~

# How to start packaging?

Once you finished your package modifications (add patch(es), update upstream, modify changelog):
~~~~
cd <dir_containing _debian_dir>
sudo pbuilder --update
pdebuild
cd /var/cache/pbuilder/result
lintian -EviIc --pedantic --color auto <pkg name>*.changes
~~~~

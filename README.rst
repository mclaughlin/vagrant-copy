Vagrant Copy
==============================================

from-vagrant-copy.py usage:
---------------
Run this via the shell::

    $ /bin/sh ./from-vagrant-copy.sh [USERNAME] [GUEST_PATH] [HOST_PATH]


...or make sure it has execute permissions::

    ./from-vagrant-copy.sh [USERNAME] [GUEST_PATH] [HOST_PATH]

And without parameters it will prompt for input::

    $ /bin/sh ./from-vagrant-copy.sh

    Vagrant box username?
    mclaughlin

    Vagrant box (guest) file path?
    /home/mclaughlin/test/

    Local (host) file path?
    ./


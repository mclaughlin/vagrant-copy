Vagrant Copy
==============================================

vagrant-copy.sh usage:
---------------
Run this via the shell::

    $ /bin/sh ./vagrant-copy.sh [DIRECTION] [USERNAME] [GUEST_PATH] [HOST_PATH]

...or make sure it has execute permissions::

    $ ./vagrant-copy.sh [DIRECTION] [USERNAME] [GUEST_PATH] [HOST_PATH]

``DIRECTION`` is either ``to`` or ``from``.

Copy a file from the vagrant box to the host::

    $ ./vagrant-copy.sh from mclaughlin /home/mclaughlin/test/ ./

Copy a file from the host to the vagrant box::

    $ ./vagrant-copy.sh to mclaughlin ./test/ /home/mclaughlin/

Without parameters it will prompt for input::

    $ ./vagrant-copy.sh

    Transfer "to" or "from" the vagrant box? from
    Guest (vagrant) username? mclaughlin
    Guest (vagrant) path? /home/mclaughlin/test/
    Host (local) path? ./

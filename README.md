puppet-rump
===========

[![Build Status](https://secure.travis-ci.org/palladius/rump.png)](http://travis-ci.org/palladius/rump)

This was done in seconds with `rump gem` (amazing).

What do you have to do to use this? I suggest you to wait a bit as I clean it
up a bit (for the moment its just for my use).

INSTALL
-------

    sudo apt-get install rubygems git libopenssl-ruby          # or whichever suits you to have GEMS available
    sudo gem install rump puppet liquid                        # dont use debian puppet, might be obsolete!
    rump clone git://github.com/palladius/puppet-rump          # Get the repo (and sub-repo)
    cd puppet-rump
    #rump freeze                                               # if you want a puppet-code-less client

Than you can run it.

On *CentOS*, try this: `sbin/centos-install.sh`

Run
---

Try this:

	rump go


Caveats
-------

'''Path'''. You might have problems to run `rump` on your system without adding gems bins to the path. For instance on Ubuntu
you have to do this (crazy innit?!?):

    export PATH=$PATH:/var/lib/gems/1.8/bin/

''submodule''. First time I run it sometimes I nede this:

    git submodule init
    git submodule update

So far sumbodules are not correctly loaded (sorry!). You can achieve this by going to the big external module and do 'git pull'.

Download and execute cycle
--------------------------

    git pull origin master &&                                  # pulls repo
    git submodule foreach git pull origin master &&            # pulls its submodules
    rump go -vd --noop                                         # remove --noop when sure it works

With `rump freeze` you dont even need to have puppet installed, cool!!!

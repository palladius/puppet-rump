puppet-rump
===========

This was done in seconds with `rump gem` (amazing).

What do you have to do to use this? I suggest you to wait a bit as I clean it
up a bit (for the moment its just for my use).

INSTALL
-------

    sudo apt-get install rubygems git                          # or whichever suits you to have GEMS available
    sudo gem install rump puppet                               # dont use debian puppet, might be obsolete!
    rump clone git://github.com/palladius/puppet-rump          # Get the repo (and sub-repo)
    cd puppet-rump
    #rump freeze                                               # if you want a puppet-code-less client

Download and execute cycle
--------------------------

    git pull origin master &&                                  # pulls repo
    git submodule foreach git pull origin master &&            # pulls its submodules
    rump go -vd --noop                                         # remove --noop when sure it works

With `rump freeze` you dont even need to have puppet installed, cool!!!

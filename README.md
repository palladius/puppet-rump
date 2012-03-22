puppet-rump
===========

This was done in seconds with `rump gem` (amazing).

What do you have to do to use this? I suggest you to wait a bit as I clean it 
up a bit (for the moment its just for my use).

But roughly:

    sudo gem install rump
    rump clone git://github.com/palladius/puppet-rump.git # ReadOnly - YOU
    #rump clone git@github.com:palladius/puppet-rump.git  # ssh r/w  - ME
    git submodule init
    git submodule update # loading the submodule
    #rump freeze # if you want a puppet-code-less client
    rump go

With `rump freeze` you dont even need to have puppet installed, cool!!!

Riccardo stuff
--------------

TODO

    Cleanup global variables in `site.pp`

Running Puppet with Rump
------------------------

From within this directory, run:

    rump go

You can pass options to Puppet after the 'go':

    rump go --debug --test

Freezing Puppet
---------------

Firstly, you need to create a git repository:

    git init

Now you can freeze Puppet:

    rump freeze

Once Rump has frozen Puppet, commit the changes:

    git commit -m 'added facter + puppet submodules' .

Now Rump will use the frozen Puppet when you run 'rump go'.


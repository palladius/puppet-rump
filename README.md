puppet-rump
===========

This was done in seconds with `rump gem` (amazing).

What do you have to do to use this? I suggest you to wait a bit as I clean it 
up a bit (for the moment its just for my use).

But roughly:

*Initialization*

    sudo apt-get install rubygems                              # or whichever suits you to have GEMS available
    sudo gem install rump
    rump clone git://github.com/palladius/puppet-rump.git      # ReadOnly - YOU
    cd puppet-rump
    #rump freeze                                               # if you want a puppet-code-less client

*Download and execute cycle*

    git pull origin master                           # pulls the main repo
    git submodule foreach git pull origin master     # pulls the submodules
    rump go -vd --noop                               # remove --noop when sure it works

With `rump freeze` you dont even need to have puppet installed, cool!!!

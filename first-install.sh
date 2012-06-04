rm -rf /root/rump
git clone git://github.com/palladius/puppet-rump.git /root/rump
cd /root/rump
make install # aptget/gem installs (once off)
make compile # initializes and runs some stuff on external/ricpuppet
#make pull    # updates the data and runs some *OTHER* stuff on external/ricpuppet
rump go
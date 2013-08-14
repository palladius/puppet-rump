# This isntall Riccardo puppet rump on CentOS
yum install -y git rubygems
gem install rump liquid --no-ri --no-rdoc
# gem install puppet --version 2.7.20                   # doesnt work with Puppet 3 (yet)
gem install puppet --version 2.7.22           # doesnt work with Puppet 3 (yet)
rump clone git://github.com/palladius/puppet-rump
cd puppet-rump
rump go


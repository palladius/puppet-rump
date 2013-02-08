
set -e
set -x

cd
# This isntall Riccardo puppet rump on CentOS
apt-get install -y rubygems git libopenssl-ruby
gem install rump puppet liquid --no-ri --no-rdoc
rump clone git://github.com/palladius/puppet-rump
cd puppet-rump
rump go

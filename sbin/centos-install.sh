
# This isntall Riccardo puppet rump on CentOS
yum install -y git
gem install rump puppet liquid --no-ri --no-rdoc
rump clone git://github.com/palladius/puppet-rump
cd puppet-rump
rump go


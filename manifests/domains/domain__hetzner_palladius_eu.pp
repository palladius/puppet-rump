# Docs for my Hetzner machines
#
class domain__hetzner_palladius_eu {
  $cluster_description_hetzner = 'Hetzner cluster this will \
    clash with other scopes? Boh!'
  
  # Machines I have in Hetzner
  include sauce
  include hamachi
}


node 'ricvm17' {
  # this is the puppet master
  include sauce
  #include puppet #broken:
# Duplicate declaration: Package[rubygems] is already declared in file /root/git/puppet-rump/modules/puppet/manifests/init.pp at line 23; cannot redeclare at /root/git/puppet-rump/modules/sauce/manifests/init.pp:124 on node ricvm17.hetzner.palladius.eu
  # include tomato
  #class { 'sauce::tomato':
  #  machine_description => 'this is the puppet master',
  #  cluster_description => $cluster_description_hetzner,
  #}
}


node 'ricvm18' {
  # hypothetical
  include staas-zookeeper
}

#node /ricvm.*/ {
#  # All hosts
#  include sauce
#  include etckeeper
#}

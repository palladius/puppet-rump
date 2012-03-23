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
  include puppet
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
# Docs for this class
$cluster_description = 'Hetzner cluster this will clash with other scopes? Boh!'
#
class domain_hetzner_palladius_eu {
  # Machines I have in Hetzner
  include sauce
  include hamachi
}


host 'ricvm17' {
  # this is the puppet master
  include puppet
  # include tomato
  #class { 'sauce::tomato':
  #  machine_description => 'this is the puppet master',
  #  cluster_description => $cluster_description,
  #}
}


host 'ricvm18' {
  # hypothetical
  include staas-zookeeper
}

host /.*/ {
  # All hosts
  include sauce
  include etckeeper
}
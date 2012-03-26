#############################################################################
# Machine on domain: dundrum.palladius.eu (my house in Dundrum, Dublin 14)
#############################################################################

$cluster_description = 'This is my cluster in Dundrum, Dublin 14'

# Common stuff
class domain__dundrum_palladius_eu {
  # Machines I have at work
  include sauce
  hamachi::network{'puppet-dundrum': pass => 'CH4NG3M3!' }
  sauce::parsley { 'cluster-version': 
    content => "for $domain: cluster_ver=$cluster_ver (defined )" 
  }
}

#############################################################################
# My nodes
#############################################################################

node 'blackrock' inherits development_node {
  $description = 'My Dell superslow workstation for watching movies'
  #class {'sauce': machine_description => $description2 }
  include sauce
  include hamachi
  #TODO include nagios::nrpe
}

node 'naucrate' inherits development_node {
  $description = 'My Debian Squeezy which is f**ed up. I have to create a new Ubuntu machine I guess :)'
  #class {'sauce': machine_description => $description2 }
  include sauce
  include hamachi
  #TODO include nagios::nrpe
}

# Unique ID: W883711DYJZ
#node 'hansel' inherits development_node {
node 'hansel' inherits development_mac_node {
  $description = 'My Mac super-client'
  sauce::parsley { 'todo-hansel':
    content => "Find a way to connect to a hamachi list without sharing pass on github :)"
  }
  manazza::add_user { rrunner:  email => "road.runner@acme.com", uid => 505 }
}

node 'vbox-hanselmo' inherits development_node {
  $description_hanselmo = 'Hansel VM with Ubuntu 11.10 to test puppet'
  sauce::parsley { 'todo-hanselmo':   content => "Look: $description_hanselmo" }
  manazza::add_user { rrunner:  email => 'road.runner@acme.com', uid => 5005 }
}
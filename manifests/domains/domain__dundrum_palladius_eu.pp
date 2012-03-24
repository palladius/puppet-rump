#############################################################################
# Machine on domain: dundrum.palladius.eu (my house in Dundrum, Dublin 14)
#############################################################################

# Common stuff
class domain__dundrum_palladius_eu {
  # Machines I have at work
  include sauce
}

#############################################################################
# My nodes
#############################################################################

node 'blackrock' inherits development_node {
  $description = 'My Dell superslow workstation for watching movies'
  #class {'sauce': machine_description => $description2 }
  include sauce
  include hamachi
  include nagios:nrpe
}
node 'hansel' inherits development_node {
  #$development_machine = 'yes'
  $description = 'My Mac super-client'
  include nagios:nrpe
}

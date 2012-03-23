
# file: domain__cloud_internal.pp
class domain__blackrock_dundrum_palladius_eu {
  # Machines I have at work
  include sauce
}

# Dundrum host at home in dublin

node 'blackrock' inherits development_node {
  $description = 'My Dell superslow workstation for watching movies'
  #class {'sauce': machine_description => $description2 }
  include 'sauce'
  include 'hamachi'
}
node 'hansel' inherits development_node {
  #$development_machine = 'yes'
  $description = 'My Mac client'
}

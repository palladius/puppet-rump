# Docs for this class
class domain_dell_palladius_eu() {
  # Machines I have in Dell for myself
}

# 
node 'salsa.dell.palladius.eu' inherits development_node {
  $description = 'My Dell superslow workstation for watching movies'
  #class {'sauce': machine_description => $description2 }
  include 'sauce'
  include 'hamachi'
}


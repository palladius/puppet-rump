# Riccardo machines within Dell space

class domain_dell_palladius_eu {
  # Machines I have in Dell for myself
  include sauce
  include hamachi
}

# 
node 'salsa.dell.palladius.eu' inherits development_node {
  $description = 'My Dell superslow workstation for watching movies'
  include 'sauce'
  #include 'hamachi'
}


# riccardo host

$servername  = "puppetmaster.$domain"
$cluster_ver = '0.9.1'

node riccardonode {
  #include puppetlabs-repo

  # include a class named as per the domain (with'.' replaced with '_'),
  # if it exists:
  #  e.g. "example.com" => "domain__example_com"
  $domain_class=regsubst($domain, '\.', '_', 'G')
  if defined("domain__$domain_class") {
    class{"domain__$domain_class": }
  }
}

node production_node inherits riccardonode {
  
}

node development_node inherits riccardonode {
  include etckeeper
  include hamachi
  #if (defined('description')) {
  #  class {'vanilla':
  #    machine_description => "[riccardonode] $description"
  #  }
  #}
}

class domain_cloud_internal {
  # Machines I have at work
}

#class "domain_hetzner_palladius_eu"
#  # Machines I have in Hetzner
#}

class development_machines {
  #class { 'puppet':
  #  development_machine => true
  #}
}

# Home

# Work
node 'vissani.cloud.internal' inherits production_node  {
  $description = 'My beefy workstation at werk with 8 beefy processors :)'
  class {'vanilla': machine_description => $description }
  #include 'vanilla'
}
node 'petomarmitta' inherits development_node {
  $development_machine = 'yes'
  $description = 'Expendable VM on Vissani built on Virtualbox'
  class {'vanilla': machine_description => $description }
}
node 'cloudia.cloud.internal' inherits development_node  {
  $description = 'My VM with hamachi and personal stuff at werk'
  class {'vanilla': machine_description => $description }
}

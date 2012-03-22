
# riccardo host

$servername  = "puppetmaster.$domain"
$cluster_ver = '0.9.1'

node riccardonode {
  #include vanilla
  include etckeeper
  include hamachi

  if (defined($description)) {
    class {'vanilla':
      machine_description => $description;
    }
  } else {
    include vanilla
  }
  #include puppetlabs-repo

  # look for and include a class named as per the domain, with
  # . replaced with _
  # e.g. for domain example.com, look for a class called example_com
  $domain_class=regsubst($domain, '\.', '_', 'G')
  if defined("domain_$domain_class") {
    class{"domain_$domain_class": }
  }
}

class domain_cloud_internal {
  # Machines I have at work
}

#class "domain_hetzner_palladius_eu"
#  # Machines I have in Hetzner
#}

class development_machines {
  class { 'puppet':
    development_machine => true
  }
}

# Home

# Work
node 'vissani.cloud.internal' inherits riccardonode {
  $description = 'My beefy workstation at werk'
  include vanilla
  include etckeeper
  include hamachi
}
node 'petomarmitta' inherits riccardonode {
  $development_machine = 'yes'
  $description = 'Expendable VM on Vissani'
  include vanilla
  include etckeeper
  include hamachi
}
node 'cloudia.cloud.internal' inherits riccardonode {
  $description = 'My VM with hamachi and personal stuff at werk'
  include vanilla
  include etckeeper
  include hamachi
}

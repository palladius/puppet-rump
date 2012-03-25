
####################################################################
# riccardo common host variables
$servername  = "puppetmaster.$domain"
$cluster_ver = '0.9.6'
$cluster_poweruser_name  = 'riccardo'
$cron_name   = 'Riccardo Carlesso'
$cronemail   = 'palladiusbonton@gmail.com' # TODO put into defined type or some 
####################################################################

# domain-dependant nodes:
import 'domains/domain__*.pp'

# Common Stuff

node riccardonode {
  #include puppetlabs-repo

  # include a class named as per the domain (with'.' replaced with '_'),
  # if it exists:
  #  e.g. "example.com" => "domain__example_com"
  $domain_class=regsubst($domain, '\.', '_', 'G')
  if defined("domain__$domain_class") {
    #notify{"TODO Include class: 'domain__$domain_class'":}
    class{"domain__$domain_class": }
  }
}

node linux_node {
  include etckeeper
}

node production_node inherits riccardonode { 
  #include etckeeper
}

node development_mac_node inherits riccardonode {
  #include etckeeper
  #include hamachi
  include sauce
  sauce::parsley { 'development_mac_node':
    content => "This is a Mac Node: $sp_os_version"
  }
}

node development_node inherits riccardonode {
  #include etckeeper
  include hamachi
}

class development_machine {

}


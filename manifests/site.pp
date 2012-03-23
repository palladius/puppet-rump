
# riccardo host

$servername  = "puppetmaster.$domain"
$cluster_ver = '0.9.2'

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
    class{"domain__$domain_class": }
  }
}

node production_node inherits riccardonode { }

node development_node inherits riccardonode {
  include etckeeper
  include hamachi
}

class development_machine {
  #class { 'puppet':
  #  development_machine => true
  #}
}


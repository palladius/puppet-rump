# Machines involved with google

$default_cluster_poweruser_name = 'rcarlesso'

class domain_dub_corp_google_com {
  include sauce
}

node 'derek.dub.corp.google.com' inherits development_node {
  $description = 'My Dell beefy workstation with user rcarlesso (feck)'
  #include 'sauce'
  #include 'hamachi'
  class {'sauce':
    poweruser_name => 'rcarlesso'
  }
}

# gricchione.eem.corp.google.com

# Machines involved with google

class domain_dub_corp_google_com {
  include sauce
}

node 'marvin.dub.corp.google.com' inherits development_node {
  $description = 'My Lenovo cool work laptop'
  include 'sauce'
  #include 'hamachi'
}


# file: domain__cloud_internal.pp
class domain__cloud_internal {
  # Machines I have at work
}

# Work hosts

node 'cloudia.cloud.internal' inherits development_node  {
  $description = 'My VM with hamachi and personal stuff at werk'
  class {'vanilla': machine_description => $description }
}
node 'vissani.cloud.internal' inherits production_node  {
  $description = 'My beefy workstation at werk with 8 beefy processors :)'
  class {'vanilla': machine_description => $description }
  #include 'vanilla'
}
node 'petomarmitta' inherits development_node {
  #$development_machine = 'yes'
  $description = 'Expendable VM on Vissani built on Virtualbox'
  class {'vanilla': machine_description => $description }
}

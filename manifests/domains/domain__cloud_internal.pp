
$cluster_description_cloud_internal = "[Cluster v$cluster_ver]
This is Dell cloud.internal domain, regulated by Denise."

# file: domain__cloud_internal.pp
class domain__cloud_internal {
  # Machines I have at work
  include sauce
}

# Work hosts

node 'cloudia.cloud.internal' inherits development_node  {
  $description_cloudia = 'My VM with hamachi and personal stuff at werk'
  #class {'sauce': machine_description => $description1 }
}

node 'vissani.cloud.internal' inherits production_node  {
  $description_vissani = 'My beefy workstation at werk with 8 beefy processors :)'
  #class {'sauce': machine_description => $description2 }
  class { 'sauce::tomato':
    machine_description => $description,
    cluster_description => $cluster_description_cloud_internal,
  }
}
node 'petomarmitta' inherits development_node {
  #$development_machine = 'yes'
  $description = 'Expendable VM on Vissani built on Virtualbox'
  #class {'sauce': machine_description => $description3 }
}

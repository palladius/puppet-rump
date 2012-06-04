# Docs for my Hetzner machines
#
class domain__c_goliardia {
  $cluster_description_goliardia = 'Cloud of Goliardia'
  
  # Machines I have in Goliardia
  include sauce
  include etckeeper
  include hamachi
  hamachi::network{'puppet-hetzner': pass => 'CH4NG3ME!' }
}

node /www.*/ {
	include sauce
	class { 'sauce::tomato':
	  machine_description => 'My Web Servers (two)',
	  cluster_description => $cluster_description_goliardia,
	}
}

#############################################################################
# Machine on domain: dundrum.palladius.eu (my house in Dundrum, Dublin 14)
#############################################################################

$cluster_description = '
	This is my cluster in Dundrum, Dublin 14. All machines have a router by NTL.
	Domain: dundrum.palladius.eu
	IPs: 192.168.1/24
'
$network_cidr        = '192.168.1/24'
$expected_gw         = '192.168.1.1'
$nagios_servers      = ['192.168.1.252','192.168.1.250'] # blackrock, naucrate

# Common stuff to
# Machines I have at home
class domain__dundrum_palladius_eu {
  include sauce
  hamachi::network{'puppet-dundrum': pass => 'CH4NG3M3!' }
  sauce::parsley { 'cluster-version': 
    content => "for $domain: cluster_ver=$cluster_ver (defined )" 
  }
  # post install add inkject to .bashrc :)
  vcsrepo { '/root/git/autopuppet-sakura':
    ensure   => present,
    provider => git,
    source   => 'git://github.com/palladius/sakura.git'
  }
  vcsrepo { '/root/git/autopuppet-rump':
    ensure   => present,
    provider => git,
    source   => 'git://github.com/palladius/puppet-rump.git'
  }
}

#############################################################################
# My nodes
#############################################################################

node 'blackrock' inherits development_node {
  $description_blackrock = 'My Dell superslow workstation for watching movies'
  #class {'sauce': machine_description => $description2 }
  hamachi::network{'puppet-dundrum': pass => 'CH4NG3M3!' }
  include sauce
  include hamachi
  include nagios::nrpe
}

node 'naucrate' inherits development_node {
  $description_naucrate = 'My new Ubuntu machine I bought with Fabio. Its been f**d up but its better since April 15 2012'
  include sauce
  include hamachi
  include dropbox
  include vnc4server
  #TODO include nagios::nrpe
}

node 'hansel' inherits development_mac_node {
  $description_hansel = 'My Mac super-client'
  sauce::parsley { 'todo-hansel':
    content => "Find a way to connect to a hamachi list without sharing pass on github :)
     Mydesc: $description_hansel
    "
  }
}

node 'vbox-hanselmo' inherits development_node {
  $description_hanselmo = 'Hansel VM with Ubuntu 11.10 to test puppet'
  sauce::parsley { 'todo-hanselmo':   content => "Look: $description_hanselmo" }

  # does it work on a Mac? Dont think so..
  logrotate::file { "puppetric-prova.log": 
    log        => "/var/log/riccardo/ok.log",
    options    => [ 'compress', 'weekly', 'rotate 4' ],
    postrotate => "/bin/echo Puppet notify logrotate on Hansel done | 
      /Users/riccardo/git/gic-hansel//bin/ricnotify green PuppetRump ok",
  }

}

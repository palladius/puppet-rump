#############################################################################
# Machine on domain: dundrum.palladius.eu (my house in Dundrum, Dublin 14)
#############################################################################

$cluster_description = 'This is my cluster in Dundrum, Dublin 14'
$nagios_servers      = ['1.2.3.4','5.6.7.8'] # for test

# Common stuff
class domain__dundrum_palladius_eu {
  # Machines I have at work
  include sauce
  hamachi::network{'puppet-dundrum': pass => 'CH4NG3M3!' }
  sauce::parsley { 'cluster-version': 
    content => "for $domain: cluster_ver=$cluster_ver (defined )" 
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
  vcsrepo { '/tmp/vcstest-git-clone':
    ensure   => present,
    provider => git,
    source   => 'git://github.com/palladius/sakura.git'
  }
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

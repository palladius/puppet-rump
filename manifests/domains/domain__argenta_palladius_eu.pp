#############################################################################
# Machine on domain: argenta.palladius.eu (my house in Dundrum, Dublin 14)
#############################################################################

$cluster_description_argenta = '
	This is my cluster in Dundrum, Dublin 14. All machines have a router by NTL.
	Domain: argenta.palladius.eu
	IPs: 192.168.1/24
'
$network_cidr_argenta        = '192.168.1/24'
$expected_gw_argenta         = '192.168.1.1'
$nagios_servers_argenta      = ['192.168.1.249'] # masagno
$admin_mail_argenta          = 'riccardo.carlesso@gmail.com'

# Common stuff to
# Machines I have at home
class domain__argenta_palladius_eu {
  include sauce
  hamachi::network{'puppet-dundrum': pass => 'CH4NG3M3!' } # Change to Argenta maybe?
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

node 'masagno' inherits development_node {
  $description_masagno = 'My ex super red-black masagno from Bolognas bought in Lugo now aperto e volante. La mamma lo vuole spento'
  include sauce
  include hamachi
  include dropbox
  #include nagios
  include vnc4server
  #TODO include nagios::nrpe
  mediawiki::new { 'naucratest':
    ensure => present,
    admin  => $admin_mail,
  }
  sauce::parsley { 'lucy-vuole':
    content => "La mamma lo vuole spento.
     Mydesc: $description_masagno
    "
  }
}

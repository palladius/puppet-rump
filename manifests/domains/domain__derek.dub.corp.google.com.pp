####################################################################
# This was created automagically for host 'derek.dub.corp.google.com'
# Template ver: 0.0.1
# On date: TODO
# FQDN:  derek.dub.corp.google.com
# User:  rcarlesso
# Email: Email not defined <palladiusbonton@gmail.com>
#
# Requirements: gem install liquid
####################################################################

$default_cluster_poweruser_name = 'rcarlesso'

#class  {
#  include sauce
#}

node 'derek.dub.corp.google.com' inherits development_node {
  $description = 'Created automagically via liquid templating engine v for derek.dub.corp.google.com'
	# TODO include in sauce the email:
  class {'sauce':
	  # poweruser_mail => 'Email not defined <palladiusbonton@gmail.com>',
    poweruser_name => 'rcarlesso'
  }
}

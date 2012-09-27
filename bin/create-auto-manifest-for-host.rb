#!/usr/bin/env ruby

require 'rubygems'
require 'liquid'
require 'socket'

VER = '0.9.1'
template_file = './manifests/domains/domain__DOMAIN.pp.liquid'
hostname = Socket.gethostname
#unless ARGV.size >= 1
#  puts "Usage: #{$0} <USERNAME>"
#  exit 1
#end

#template_file = ENV['SVNHOME'] + '/templates/liquid/eclipse.project.liquid'
out_file = template_file.gsub('DOMAIN', hostname).gsub('.liquid$','')

print "$0: Trying to create from template this file: #{out_file}\n"

template = File.open(template_file).read

results = Liquid::Template.parse(template).render(
   'version'  => VER,
   'fqdn'     => hostname,
   'username' => ARGV[0] || ENV['USER']
)

print results
File.open(out_file,'w').write(results)
puts "# Also written rendered file: #{out_file}"

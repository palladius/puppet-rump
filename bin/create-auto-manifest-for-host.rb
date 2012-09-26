#!/usr/bin/env ruby

require 'rubygems'
require 'liquid'

VER = '0.9.2'

unless ARGV.size >= 1
  puts "Usage: #{$0} Title of this project"
  exit 1
end

title = ARGV.join(' ')

template_file = ENV['SVNHOME'] + '/templates/liquid/eclipse.project.liquid'
out_file = '.project' 

template = File.open(template_file).read

results = Liquid::Template.parse(template).render(
   'version'   => VER,
   'comment'   => "Created with #{$0} v#{VER}",
   'title' => title
)

print results
File.open(out_file,'w').write(results)
puts "# Also written rendered file: #{out_file}"

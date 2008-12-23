require 'rubygems'
require File.join(File.dirname(__FILE__), '..', 'lib', 'twitter')
config = YAML::load(open(ENV['HOME'] + '/.twitter'))
 
twitter = Twitter::Base.new(config['email'], config['password'])
puts twitter.post("Testing out an #svc post").inspect
 
# sending a direct message
# puts twitter.d('josephdee', 'Testing out an #svc post').inspect
require 'rubygems'
require File.join(File.dirname(__FILE__), '..', 'lib', 'twitter')
 
Twitter::Search.new('httparty').each { |r| puts r.inspect,'' }
 
# search = Twitter::Search.new
# search.from('josephdee').to('igniter').each { |r| puts r.inspect, '' }
# pp search.result
# search.clear
 
# search.from('josephdee').to('igniter').since(814529437).containing('^ventwit').each { |r| puts r.inspect, '' }
# search.clear
#
# search.geocode('40.757929', '-73.985506', '50mi').containing('^ventwit').each { |r| puts r.inspect, '' }
# search.clear
 
# pp search.from('josephdee').fetch()
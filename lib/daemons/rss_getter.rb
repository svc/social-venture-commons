#!/usr/bin/env ruby

# You might want to change this
ENV["RAILS_ENV"] ||= "production"

require File.dirname(__FILE__) + "/../../config/environment"

log = Logger.new(File.dirname(__FILE__)+"/../../log/rss_getter.log")
log.level = Logger::DEBUG

$running = true
Signal.trap("TERM") do 
  $running = false
end

while($running) do
  log.debug("I'm still here #{Time.now}")
  require 'simple-rss'
  require 'open-uri'
  require 'pp'
  
  Venture.all.each do |v|
    v.feeds.each do |f|
      rss = SimpleRSS.parse open(f.url)
      rss.items.each do |i|
        next if (f.last_fetch || f.uri.nil?) &&  (i.pubDate < f.last_fetch)
        m = Message.new
        m.twitter_text = "#{i.title} :: #{i.description[0...140]}"[0...140]
        m.ventures << v
        m.message_type_id = 2
        m.original_url = i.link
        m.created_at = i.pubDate
        m.save!
      end
      f.last_fetch = Time.now
      f.save
    end
  end
  
  sleep 60
end
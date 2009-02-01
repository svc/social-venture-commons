#!/usr/bin/env ruby

# You might want to change this
ENV["RAILS_ENV"] ||= "production"

require File.dirname(__FILE__) + "/../../config/environment"


$running = true
Signal.trap("TERM") do 
  $running = false
end

while($running) do  
  begin
    MessageParser.get_messages_and_parse({:count=>200}) 
  rescue Twitter::CantConnect => e
    
  end    
  sleep 60
end
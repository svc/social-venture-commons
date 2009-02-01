require File.join(File.dirname(__FILE__),'../message_parser')

namespace :stream do
  task :fetch => :environment do
    message_count = Message.count
    user_count = Account.count
    needs_count = Need.count
    venture_count = Venture.count
    
    MessageParser.get_messages_and_parse({:count=>200})   

    puts "New Messages: #{Message.count - message_count}"
    puts "New Accounts: #{Account.count - user_count}"
    puts "New Needs: #{Need.count - needs_count}"
    puts "New Ventures: #{Venture.count - venture_count}"
  end
  
  task :daemon => :environment do
    loop do
      Rake::Task['stream:fetch'].execute
      sleep 60
    end
  end  
end

namespace :rss do
  task :fetch => :environment do
    require 'simple-rss'
    require 'open-uri'
    require 'pp'
    
    Venture.all.each do |v|
      v.feeds.each do |f|
        rss = SimpleRSS.parse open(f.url)
        rss.items.each do |i|
          next if f.last_fetch &&  i.pubDate < f.last_fetch
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
  end
end

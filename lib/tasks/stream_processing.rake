require File.join(File.dirname(__FILE__),'../message_parser')

namespace :stream do
  task :fetch => :environment do
    last_message = Message.maximum(:updated_at)
    message_count = Message.count
    user_count = Account.count
    
    options = Hash.new
    options[:since] = last_message if last_message
    
    Twitter::Base.new(TWITTER_USERNAME,TWITTER_PASSWORD).timeline(:friends,options).each do |tweet|
      MessageParser.parse(tweet)      
    end
    
    puts "New Messages: #{Message.count - message_count}"
    puts "New Accounts: #{Account.count - user_count}"
  end
end

require File.join(File.dirname(__FILE__),'../message_parser')

namespace :stream do
  task :fetch => :environment do
    last_message = Message.maximum(:updated_at)
    message_count = Message.count
    user_count = Account.count
    
    MessageParser.get_messages_and_parse   

    puts "New Messages: #{Message.count - message_count}"
    puts "New Accounts: #{Account.count - user_count}"
  end
end

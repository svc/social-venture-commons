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
end

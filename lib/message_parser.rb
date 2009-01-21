class MessageParser
  def self.parse(tweet)

    tweet.text.downcase!
    puts '------------------------------------'
    puts " RAW TWEET: #{tweet.text}"
    
    return false unless tweet.text =~ /\^/
    
    possible_venture_tags       = tweet.text.scan(/(\^[a-z0-9]*)/).uniq
    
    puts "Possible Venture Tags: #{possible_venture_tags.inspect}"
    
    ventures = Venture.all(:conditions=>"tag IN ('#{possible_venture_tags.join('\',\'')}')")
    
    if ventures.any?
      possible_venture_need_tags  = tweet.text.scan(/\^[a-z0-9]* ![a-z0-9]*/).uniq
      
      puts "Possible venture Need tags #{possible_venture_need_tags}"
      
      needs = Need.all(:conditions=>"tag IN ('#{possible_venture_need_tags.join('\',\'')}')")
      
      account = Account.find_by_twitter_id(tweet.user.id)
      account = Account.create!(:twitter_id=>tweet.user.id,:name=>tweet.user.name,:screen_name=>tweet.user.screen_name,:url=>tweet.user.url,:description=>tweet.user.description,:profile_image_url=> tweet.user.profile_image_url,:account_type => AccountType.find_by_name('User')) unless account      
            
      message = Message.new(:twitter_id=>tweet.id, :twitter_text=>tweet.text,:account_id=>account.id)
      message.ventures << ventures
      message.needs << needs     
      
      begin
        message.save
      rescue Exception => e
        puts "Duplicate Twitter Message Detected"
      end
      
    end
  end
  
  def self.get_messages_and_parse(options = Hash.new)
    message_last_updated_at = Message.maximum(:updated_at)
    options[:since] = Message.maximum(:updated_at) unless options[:since] && message_last_updated_at.nil?

    Twitter::Base.new(TWITTER_USERNAME,TWITTER_PASSWORD).timeline(:friends).each do |tweet|
      MessageParser.parse(tweet)      
    end
  end
end
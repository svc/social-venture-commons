require 'digest/sha1'
class Account
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken

  attr_accessible :login, :email, :name, :password, :password_confirmation, :url, :description, :twitter_id, :screen_name, :profile_image_url

  def self.authenticate(login, password)
    return nil if login.blank? || password.blank?
    begin
      
      twitter = Twitter::Base.new(login,password)
      twitter_user = Twitter::User.new_from_xml(twitter.verify_credentials)
      
      account = Account.find_by_twitter_id(twitter_user.id)
      
      if not account
        account = Account.create(
            :twitter_id => twitter_user.id,
            :name => twitter_user.name,
            :screen_name => twitter_user.screen_name,
            :url => twitter_user.url,
            :description => twitter_user.description,
            :profile_image_url => twitter_user.profile_image_url
          )
                  
        # Twitter::Base.new(TWITTER_USERNAME,TWITTER_PASSWORD).follow(account.twitter_id)
      end

      account
    rescue Exception => e
      return nil
    end
  end

  def login=(value)
    write_attribute :login, (value ? value.downcase : nil)
  end

  def email=(value)
    write_attribute :email, (value ? value.downcase : nil)
  end
end
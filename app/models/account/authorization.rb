require 'digest/sha1'
class Account
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken

  validates_presence_of     :login
  validates_length_of       :login,    :within => 3..40
  validates_uniqueness_of   :login
  validates_format_of       :login,    :with => Authentication.login_regex, :message => Authentication.bad_login_message

  validates_format_of       :name,     :with => Authentication.name_regex,  :message => Authentication.bad_name_message, :allow_nil => true
  validates_length_of       :name,     :maximum => 100

  validates_presence_of     :email
  validates_length_of       :email,    :within => 6..100 #r@a.wk
  validates_uniqueness_of   :email
  validates_format_of       :email,    :with => Authentication.email_regex, :message => Authentication.bad_email_message

  attr_accessible :login, :email, :name, :password, :password_confirmation

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
      end

      account.twitter_password = password
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
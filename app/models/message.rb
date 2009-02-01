class Message < ActiveRecord::Base
	default_scope :order=>'created_at DESC'
	
	named_scope :tweets, :conditions =>['message_type_id = 1']
	
  cattr_reader :per_page
  @@per_page = 20

  
  belongs_to :account
  belongs_to :message_type

  has_and_belongs_to_many :ventures
  has_and_belongs_to_many :needs
    
  def text
    twitter_text
  end
  
  def type
    message_type.to_s.to_sym
  end
end

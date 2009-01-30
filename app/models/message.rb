class Message < ActiveRecord::Base
	default_scope :order=>'created_at DESC'
	
  cattr_reader :per_page
  @@per_page = 20

  
  belongs_to :account

  has_and_belongs_to_many :ventures
  has_and_belongs_to_many :needs
    
  def text
    twitter_text
  end
end

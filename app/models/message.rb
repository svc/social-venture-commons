class Message < ActiveRecord::Base
  belongs_to :account

  has_and_belongs_to_many :ventures
  has_and_belongs_to_many :needs
  
  def text
    twitter_text
  end
  

end

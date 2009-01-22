class Need < ActiveRecord::Base
  belongs_to :venture
  belongs_to :user
  
  has_and_belongs_to_many :messages
  
  def short_tag
    tag
  end
end

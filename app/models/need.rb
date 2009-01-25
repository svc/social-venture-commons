class Need < ActiveRecord::Base
  belongs_to :user
    
  has_and_belongs_to_many :ventures
  has_and_belongs_to_many :messages
  
  validates_uniqueness_of :tag
  
  def short_tag
    tag
  end
end

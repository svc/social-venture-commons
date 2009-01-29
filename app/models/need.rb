class Need < ActiveRecord::Base
  belongs_to :user
    
  has_and_belongs_to_many :ventures
  has_and_belongs_to_many :messages
  
  validates_uniqueness_of :tag

	def self.with_message_counts(options ={:limit=>5})
		#TODO: dan make this work
    # Need.find_by_sql("SELECT n.*, COUNT(m.id) message_count FROM needs n LEFT JOIN messages_needs mv ON n.id = mv.venture_id LEFT JOIN messages m ON mv.message_id = m.id GROUP BY mv.need_id ORDER BY message_count DESC limit #{options[:limit]}")
  end
  
  def short_tag
    tag
  end
  
  def to_s
    tag
  end
end

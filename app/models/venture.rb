class Venture < ActiveRecord::Base
  
  has_many :feeds
	
	has_and_belongs_to_many :messages
	has_and_belongs_to_many :needs
	
	validates_uniqueness_of :tag
	
	def self.with_message_counts(options ={:limit=>5})
    Venture.find_by_sql("SELECT v.*, COUNT(m.id) message_count FROM ventures v LEFT JOIN messages_ventures mv ON v.id = mv.venture_id LEFT JOIN messages m ON mv.message_id = m.id GROUP BY mv.venture_id ORDER BY message_count DESC limit #{options[:limit]}")
  end
  
	def to_s
	 name || tag || ""
	end
	
	# TODO: danw: Unhack this
	def feed
	 feeds[0] = feeds.create unless feeds[0]
	 feeds[0]
	end
	
	def feed=(feed_url)
	  feeds[0] = Feed.new unless feeds[0]
	  feed = feeds[0]
	  feed.url = feed_url
	  feed.save	  
	end
end

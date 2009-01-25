class Venture < ActiveRecord::Base
	
	has_and_belongs_to_many :messages
	has_and_belongs_to_many :needs
	
	validates_uniqueness_of :tag
	
	def to_s
	 name
	end
end

class Venture < ActiveRecord::Base
	has_many :needs
	
	has_and_belongs_to_many :messages
	
	def to_s
	 name
	end
end

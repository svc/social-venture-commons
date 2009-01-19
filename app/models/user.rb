class User < ActiveRecord::Base
  concerned_with :authorization, :roles 
  
	has_many :skillTag
	
	def to_s
	 name
	end
end

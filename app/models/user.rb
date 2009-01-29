# TODO: Refactor and remove 
class User < ActiveRecord::Base
  
	has_many :skillTag
	
	def to_s
	 name
	end
end

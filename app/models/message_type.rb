class MessageType < ActiveRecord::Base
  def to_s
    name
  end
  
  def to_param
    icon
  end
end

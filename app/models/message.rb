class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :venture
  belongs_to :need
end

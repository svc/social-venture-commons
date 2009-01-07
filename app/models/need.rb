class Need < ActiveRecord::Base
  belongs_to :venture
  belongs_to :user
end

class Account < ActiveRecord::Base
  has_one :account_type
  
  concerned_with :authorization  
end


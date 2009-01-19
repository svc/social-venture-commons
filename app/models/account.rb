class Account < ActiveRecord::Base
  has_one :account_type
end

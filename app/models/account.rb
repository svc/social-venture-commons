class Account < ActiveRecord::Base
  has_one :account_type
  attr_accessor :twitter_password
  concerned_with :authorization  
end

    # t.integer  "twitter_id"
    # t.string   "name"
    # t.string   "screen_name"
    # t.string   "url"
    # t.text     "description"
    # t.string   "profile_image_url"
    # t.integer  "account_type_id"
    # t.datetime "created_at"
    # t.datetime "updated_at"
    
    
    # u = find_by_login(login) # need to get the salt
    # u && u.authenticated?(password) ? u : nil

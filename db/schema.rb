# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090119161920) do

  create_table "account_types", :force => true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accounts", :force => true do |t|
    t.integer  "twitter_id"
    t.string   "name"
    t.string   "screen_name"
    t.string   "url"
    t.text     "description"
    t.string   "profile_image_url"
    t.integer  "account_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
  end

  add_index "accounts", ["twitter_id"], :name => "index_accounts_on_twitter_id"

  create_table "messages", :force => true do |t|
    t.string   "twitter_id"
    t.text     "twitter_text"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["account_id"], :name => "index_messages_on_user_id"
  add_index "messages", ["twitter_id"], :name => "index_messages_on_twitter_id", :unique => true

  create_table "messages_needs", :id => false, :force => true do |t|
    t.integer "message_id"
    t.integer "need_id"
  end

  add_index "messages_needs", ["message_id", "need_id"], :name => "index_messages_needs_on_message_id_and_need_id", :unique => true

  create_table "messages_ventures", :id => false, :force => true do |t|
    t.integer "message_id"
    t.integer "venture_id"
  end

  add_index "messages_ventures", ["message_id", "venture_id"], :name => "index_messages_ventures_on_message_id_and_venture_id", :unique => true

  create_table "needs", :force => true do |t|
    t.text     "description"
    t.string   "name"
    t.string   "tag"
    t.integer  "venture_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "roles_accounts", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "account_id"
  end

  add_index "roles_accounts", ["account_id"], :name => "index_roles_accounts_on_account_id"
  add_index "roles_accounts", ["role_id"], :name => "index_roles_accounts_on_role_id"

  create_table "skill_tags", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "need_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ventures", :force => true do |t|
    t.text     "description"
    t.string   "name"
    t.string   "tag"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

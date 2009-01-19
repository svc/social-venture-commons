class AddingIndexesToMessages < ActiveRecord::Migration
  def self.up
    add_index :messages, :user_id
    add_index :messages, :venture_id
    add_index :messages, :need_id
    add_index :messages, :twitter_id, :unique => true
  end

  def self.down
    remove_index :messages, :twitter_id
    remove_index :messages, :need_id
    remove_index :messages, :venture_id
    remove_index :messages, :user_id
  end
end

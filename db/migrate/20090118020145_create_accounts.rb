class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.integer :twitter_id
      t.string :name
      t.string :screen_name
      t.string :url
      t.text :description
      t.string :profile_image_url
      t.integer :account_type_id

      t.timestamps
    end
    
    add_index :accounts, :twitter_id
  end

  def self.down
    remove_index :accounts, :twitter_id
    
    drop_table :accounts
  end
end

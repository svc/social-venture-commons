class CreateFeeds < ActiveRecord::Migration
  def self.up
    create_table :feeds do |t|
      t.string :title
      t.string :url
      t.integer :venture_id
      t.datetime :last_fetch
      
      t.timestamps
    end
  end

  def self.down
    drop_table :feeds
  end
end
 
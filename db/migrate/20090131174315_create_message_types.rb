class CreateMessageTypes < ActiveRecord::Migration
  def self.up
    create_table :message_types do |t|
      t.string :name
      t.string :icon

      t.timestamps
    end
    
    MessageType.create(:name=>'twitter')
    MessageType.create(:name=>'rss')
  end

  def self.down
    drop_table :message_types
  end
end

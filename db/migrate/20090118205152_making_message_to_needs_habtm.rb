class MakingMessageToNeedsHabtm < ActiveRecord::Migration
  def self.up
    create_table :messages_needs, :force => true,:id=>false do |t|
      t.integer :message_id
      t.integer :need_id
    end
    
    add_index :messages_needs, [:message_id, :need_id], :unique => true
  end

  def self.down
    remove_index :messages_needs, :column => [:message_id, :need_id]
    drop_table :messages_needs
  end
end

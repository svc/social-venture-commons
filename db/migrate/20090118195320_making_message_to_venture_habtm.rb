class MakingMessageToVentureHabtm < ActiveRecord::Migration
  def self.up
    remove_column :messages, :venture_id
    remove_column :messages, :need_id
    
    create_table :messages_ventures, :force => true,:id=>false do |t|
      t.integer :message_id
      t.integer :venture_id
    end
    
    add_index :messages_ventures, [:message_id, :venture_id], :unique => true
  end

  def self.down
    remove_index :messages_ventures, :column => [:message_id, :venture_id]
    drop_table :messages_ventures
    add_column :messages, :need_id, :integer
    add_column :messages, :venture_id, :integer
  end
end

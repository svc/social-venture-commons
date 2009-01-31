class AddMessageTypeIdToMessages < ActiveRecord::Migration
  def self.up
    add_column :messages, :message_type_id, :integer, :default=>1
  end

  def self.down
    remove_column :messages, :message_type_id
  end
end

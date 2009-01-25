class MakingNeedToVentureHabtm < ActiveRecord::Migration
  def self.up
    create_table :needs_ventures, :force => true, :id => false do |t|
      t.integer :need_id, :venture_id
    end
    add_index :needs_ventures, [:venture_id, :need_id], :unique => true
  end

  def self.down
    remove_index :needs_ventures, :column => [:venture_id, :need_id]
    drop_table :needs_ventures
  end
end

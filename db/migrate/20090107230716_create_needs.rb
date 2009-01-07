class CreateNeeds < ActiveRecord::Migration
  def self.up
    create_table :needs do |t|
      t.text :description
      t.string :name
      t.string :tag
      t.references :venture
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :needs
  end
end

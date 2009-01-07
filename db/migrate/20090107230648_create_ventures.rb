class CreateVentures < ActiveRecord::Migration
  def self.up
    create_table :ventures do |t|
      t.text :description
      t.string :name
      t.string :tag
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :ventures
  end
end

class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.string :t_id
      t.datetime :published
      t.string :link
      t.string :title
      t.text :content
      t.datetime :t_updated
      t.string :authorname
      t.string :authorurl
      t.references :user
      t.references :venture
      t.references :need

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end

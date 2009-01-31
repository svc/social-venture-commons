class AddOriginalUrlToMessages < ActiveRecord::Migration
  def self.up
    add_column :messages, :original_url, :string
  end

  def self.down
    remove_column :messages, :original_url
  end
end

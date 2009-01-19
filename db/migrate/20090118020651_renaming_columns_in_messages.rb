class RenamingColumnsInMessages < ActiveRecord::Migration
  def self.up
    rename_column :messages, :t_id, :twitter_id
    remove_column :messages, :authorname
    remove_column :messages, :authorurl
    remove_column :messages, :published
    remove_column :messages, :link
    remove_column :messages, :t_updated
    remove_column :messages, :title
    rename_column :messages, :content, :twitter_text
  end

  def self.down
    rename_column :messages, :twitter_text, :content
    add_column :messages, :title, :string
    add_column :messages, :t_updated, :datetime
    add_column :messages, :link, :string
    add_column :messages, :published, :datetime
    add_column :messages, :authorurl, :string
    add_column :messages, :authorname, :string
    
    rename_column :messages, :twitter_id, :t_id
    
  end
end

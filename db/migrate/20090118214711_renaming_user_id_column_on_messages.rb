class RenamingUserIdColumnOnMessages < ActiveRecord::Migration
  def self.up
    rename_column :messages, :user_id, :account_id
  end

  def self.down
    rename_column :messages, :account_id, :user_id
    
  end
end

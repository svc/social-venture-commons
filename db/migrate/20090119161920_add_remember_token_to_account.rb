class AddRememberTokenToAccount < ActiveRecord::Migration
  def self.up
    add_column :accounts, :remember_token, :string, :limit => 40
    add_column :accounts, :remember_token_expires_at, :datetime
  end

  def self.down
    remove_column :accounts, :remember_token
    remove_column :accounts, :remember_token_expires_at
  end
end
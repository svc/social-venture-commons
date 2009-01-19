class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table "roles" do |t|
      t.string :name
    end
    
    # generate the join table
    create_table "roles_accounts", :id => false do |t|
      t.integer "role_id", "account_id"
    end
    add_index "roles_accounts", "role_id"
    add_index "roles_accounts", "account_id"
  end

  def self.down
    drop_table "roles"
    drop_table "roles_accounts"
  end
end
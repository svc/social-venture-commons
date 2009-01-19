class CreateAccountTypes < ActiveRecord::Migration
  def self.up
    create_table :account_types do |t|
      t.text :name

      t.timestamps
    end
    
    AccountType.create!(:name=>"Venture")
    AccountType.create!(:name=>"User\n")
  end

  def self.down
    drop_table :account_types
  end
end

class CreateSkillTags < ActiveRecord::Migration
  def self.up
    create_table :skill_tags do |t|
      t.string :name
      t.references :user
      t.references :need

      t.timestamps
    end
  end

  def self.down
    drop_table :skill_tags
  end
end

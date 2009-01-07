class SkillTag < ActiveRecord::Base
  belongs_to :user
  belongs_to :need
end

class Skill < ActiveRecord::Base
  has_many :users
  has_many :users through: :user_skills
end

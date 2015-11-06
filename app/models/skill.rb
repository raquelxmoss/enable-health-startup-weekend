class Skill < ActiveRecord::Base
  has_many :user_skills
  has_many :users, through: :user_skills

  before_action :normalize_title

  def normalize_title
  	title.titelize
  end
end

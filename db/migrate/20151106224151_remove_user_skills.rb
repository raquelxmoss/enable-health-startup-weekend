class RemoveUserSkills < ActiveRecord::Migration
  def change
  	drop_table :user_skills
  end
end

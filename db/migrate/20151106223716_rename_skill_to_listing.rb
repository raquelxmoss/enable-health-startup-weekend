class RenameSkillToListing < ActiveRecord::Migration
  def change
  	rename_table :skills, :listings
  end
end

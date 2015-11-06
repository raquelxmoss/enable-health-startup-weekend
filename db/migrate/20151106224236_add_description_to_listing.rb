class AddDescriptionToListing < ActiveRecord::Migration
  def change
  	add_column :listings, :description, :text
  	add_column :listings, :expiration_date, :datetime
  	add_column :listings, :status, :string, default: 'open'
  end
end

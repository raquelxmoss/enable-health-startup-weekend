class AddUrgencyToListings < ActiveRecord::Migration
  def change
    add_column :listings, :urgency, :string
  end
end

class AddListingIdToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :listing_id, :integer
  end
end

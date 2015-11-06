class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
			t.string :subject
			t.text :body
			t.integer :referenced_message_id
			t.integer :sender_id
			t.integer :recipient_id
			t.string :status
			t.timestamps null: false
    end
  end
end

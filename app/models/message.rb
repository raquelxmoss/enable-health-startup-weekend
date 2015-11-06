class Message < ActiveRecord::Base
	belongs_to :sender, class_name: "User"
	belongs_to :recipient, class_name: "User"
	belongs_to :referenced_message, class_name: "Message"
end
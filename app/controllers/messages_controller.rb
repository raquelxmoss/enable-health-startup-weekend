class MessagesController < ApplicationController

	before_filter :check_message_owner, only: [:show]
	before_filter :load_message, only: [:show]

	def show

	end

	def index
		@received_messages = current_user.received_messages
		@sent_messages = current_user.sent_messages
	end

	def new
		if params[:recipient]
			@message = Message.new(recipient: User.find(params[:recipient]))
		else
			@message = Message.new 
		end
	end

	def create
		@message = Message.new(prepare_message_params)
		if @message.save
			flash[:notice] = "Thanks! Your message has been sent"
			redirect_to :back
		else
			flash[:error] = @message.errors.full_messages.join("\n")
			redirect_to :back
		end
	end

	def destroy
		@message.destroy
		redirect_to root_path
	end

private

	def prepare_message_params
		{sender_id: current_user.id, recipient_id: get_recipient, subject: message_params[:subject], body: message_params[:body]}
	end

	def get_recipient
		params[:message][:recipient_id] || 
		User.find_by_email(params[:message][:recipient]).id
	end
	
	def message_params
		params.require(:message).permit(:recipient_id, :subject, :body)
	end

	def load_message
		@message = Message.find(params[:id])
	end

	def check_message_owner
		if current_user.id != (@message.recipient_id || @message.sender_id)
			redirect_to root_path
		end
	end
end
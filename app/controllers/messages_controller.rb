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
	end

	def create
		@message = Message.new(message_params)
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
	
	def message_params
		{sender_id: current_user.id}
		.merge(params.require(:message).permit(:recipient_id, :subject, :body))
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
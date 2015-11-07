class MessagesController < ApplicationController

	def show
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

end
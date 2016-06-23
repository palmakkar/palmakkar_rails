class MessagesController < ApplicationController

	def new
		@message = Message.new
	end

	def create
		@message = Message.create(message_params)
		if @message.persisted?
			flash.now[:success] = "Your Message has been sent!"
		else
			flash.now[:danger] = "Message failed to send."
			render 'new'
		end
	end

	private

	#white list parameters
	def message_params
		params.require(:message).permit(:email, :body)
	end
end

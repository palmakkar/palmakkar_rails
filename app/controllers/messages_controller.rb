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

	def show
		@message = Message.find(params[:id])
	end

	def edit
		@message = Message.find(params[:id])
	end

	def update
		@message = Message.find(params[:id])
		if @message.update_attributes(message_params)
			flash[:success] = "Message successfully updated"
			redirect_to @message
		else
			render 'edit'
		end
	end


	private

	#white list parameters
	def message_params
		params.require(:message).permit(:email, :body)
	end
end

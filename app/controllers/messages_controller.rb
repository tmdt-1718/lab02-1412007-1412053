class MessagesController < ApplicationController
	def show
		@message = Message.find(params[:id]) 
		if @message.receiverid == session[:current_user_id]
			@message.update_attribute(:seentime, DateTime.now)
		end
	end

	def new
		# @friends = Friendship.where(user_id: current_user.id).friend
		# @friends = current_user.friendships
		@friends = User.where(id: Friendship.where(user_id: current_user.id).pluck(:friend_id))
	end

	def create
		message = Message.create!(title: params[:message][:title], content: params[:message][:content], sender_id: session[:current_user_id], receiverid: params[:message][:receiverid])
	end

	def showreceivedmessage
		@messages = Message.where(receiverid: session[:current_user_id]).order('created_at DESC')
		# @messages = Message.find_by(receiverid: session[:current_user_id])
		# (session[:current_user_id])

		# if !@messages.nil?
		# 	@messages = Message.find_by_receiver_id(session[:current_user_id]).order('created_at DESC')
		# end
	end

	private
    def message_params
    	params.require(:message).permit(:title, :content)
    end
end    

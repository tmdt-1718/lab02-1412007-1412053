class MessagesController < ApplicationController
	before_action :authenticate

	def showsentmessage
		@messages = Message.where(user_id: current_user.id).order('created_at DESC').page(params[:page]).per_page(2)
	end

	def new
		# @friends = Friendship.where(user_id: current_user.id).friend
		# @friends = current_user.friendships
		@friends = User.where(id: Friendship.where(user_id: current_user.id).pluck(:friend_id))
	end

	def create
		if (params[:message][:receiverid].nil?)
			render :new
		else
			current_user.messages.create!(title: params[:message][:title], content: params[:message][:content], receiverid: params[:message][:receiverid], image: params[:message][:image])
		# message = Message.create!(title: params[:message][:title], content: params[:message][:content], sender_id: current_user.id, receiverid: params[:message][:receiverid])
		flash[:success] = 'Your message has been sent.'
		redirect_to showsentmessage_path
		end
	end

	def show
		@message = Message.find(params[:id]) 
		if @message.receiverid == session[:current_user_id]
			@message.update_attribute(:seentime, DateTime.now)
		end
	end

	def showreceivedmessage
		#.page(params[:page]).per_page(2) --moi trang gom 2 mail
		@messages = Message.where(receiverid: session[:current_user_id]).order('created_at DESC').page(params[:page]).per_page(2)
		# @messages = Message.find_by(receiverid: session[:current_user_id])
		# (session[:current_user_id])

		# if !@messages.nil?
		# 	@messages = Message.find_by_receiver_id(session[:current_user_id]).order('created_at DESC')
		# end
	end
end
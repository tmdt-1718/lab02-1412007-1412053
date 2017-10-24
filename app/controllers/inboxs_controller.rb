class InboxsController < ApplicationController
	before_action :authenticate

	def index
		@messages = Message.where(receiverid: session[:current_user_id])
		# @messages = Message.find_by(receiverid: session[:current_user_id])
		# (session[:current_user_id])

		# if !@messages.nil?
		# 	@messages = Message.find_by_receiver_id(session[:current_user_id]).order('created_at DESC')
		# end
	end

end

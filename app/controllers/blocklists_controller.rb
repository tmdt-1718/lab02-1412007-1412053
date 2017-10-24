class BlocklistsController < ApplicationController

	def create
		# @user = User.find(params[:id])
		@blocklist = current_user.blocklists.build(:blocked_id => params[:blocked_id])
		# @friendship2 = Friendship.create!(user_id: params[:friend_id], friend_id: current_user.id)
		if @blocklist.save
			flash[:success] = "Block successfully."
			redirect_to users_path(params[:id])
			# redirect_to users_path(params[:id])
		else
			flash[:error] = "Cannot block."
			redirect_to users_path(params[:id])
		end
	end

	def destroy
		@blocklist = current_user.blocklists.find(params[:id])

		# @friendship2 = Friendship.find_by(user_id: @friendship.friend_id, friend_id: current_user.id)

		@blocklist.destroy

		# @friendship2.destroy

		flash[:success] = "Unblock successfully."
		redirect_to users_path(session[:current_user_id])
	end
end

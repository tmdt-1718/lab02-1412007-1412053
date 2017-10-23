class FriendshipsController < ApplicationController

	def create
		# @user = User.find(params[:id])
		@friendship = current_user.friendships.build(:friend_id => params[:friend_id])
		@friendship2 = Friendship.create!(user_id: params[:friend_id], friend_id: current_user.id)
		if @friendship.save
			flash[:success] = "Added friend successfully."
			redirect_to users_path(params[:id])
			# redirect_to users_path(params[:id])
		else
			flash[:error] = "Cannot add friend."
			redirect_to users_path(params[:id])
		end
	end

	def destroy
		@friendship = current_user.friendships.find(params[:id])

		@friendship2 = Friendship.find_by(user_id: @friendship.friend_id, friend_id: current_user.id)

		@friendship.destroy

		@friendship2.destroy

		flash[:success] = "Unfriend successfully."
		redirect_to users_path(session[:current_user_id])
	end
end

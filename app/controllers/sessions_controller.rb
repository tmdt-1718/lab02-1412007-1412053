class SessionsController < ApplicationController
	def new
		
	end

	def create
		user = User.find_by(email: session_params[:email])
		# user.authenticate(session_params[:password])
		if user.nil?
			flash[:error] = "Wrong email or password."
			render :new
		else
			user.try(:authenticate, session_params[:password])
			if !user.try(:authenticate, session_params[:password])
				flash[:error] = "Wrong email or password."
				render :new
			else
				login(user)

				#UserMailer.login_email(user).deliver_now

				flash[:success] = "Login successfully."
				redirect_to show_message_path
			end
		end
	end




	def destroy
		logout

		redirect_to login_path
	end

	private
	def session_params
		params.require(:session).permit(:email, :password)
	end
end


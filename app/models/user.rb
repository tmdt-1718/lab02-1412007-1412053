class User < ApplicationRecord
	has_many :friendships
	has_many :friends, :through => :friendships
	has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
	has_many :inverse_friends, :through => :inverse_friendships, :source => :user

	has_many :blocklists
	has_many :blockeds, :through => :blocklists

	has_many :messages

	has_secure_password

	def self.authenticate!(session_params)
		user = User.authenticate(session_params)

		if user.nil?
			raise RecordNotFound
		else
			user
		end
	end

  # def self.authenticate(session_params)
  # 	user = User.find_by(email: session_params[:email])
  
  # 	if user.password == session_params[:password]
  # 		user
  # 	else
  # 		false
  # 	end
  # end

  def self.authenticate?(session_params)
  	!User.authenticate(session_params).nil?
  end
end

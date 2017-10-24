class Message < ApplicationRecord
	belongs_to :user
	# belongs_to :friend, :class_name => "User"
	mount_uploader :image, ImageUploader
end

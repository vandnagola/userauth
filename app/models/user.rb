class User < ApplicationRecord
	has_secure_password
	before_save {self.email = email.downcase}
	has_many :articles, dependent: :destroy
	has_one_attached :profile_pic
	validates :username, presence: true, 
						length: {minimum:3, maximum:25}, 
						uniqueness: {case_sensitive: false}
	VALID_EMAIL_FORMATE = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, 
					  length: {maximum:150},
					  uniqueness: {case_sensitive: false},
					  format:{with: VALID_EMAIL_FORMATE}

	def profile_pic_as_thumbnail
		return unless profile_pic.attached? && profile_pic.content_type.in?(%w[image/jpg image/jpeg image/png])

		profile_pic.variant(resize_to_limit: [300, 300]).processed
	end

end

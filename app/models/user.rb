class User < ApplicationRecord
	has_secure_password
	before_save {self.email = email.downcase}
	has_many :articles, dependent: :destroy
	validates :username, presence: true, 
						length: {minimum:3, maximum:25}, 
						uniqueness: {case_sensitive: false}
	VALID_EMAIL_FORMATE = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, 
					  length: {maximum:150},
					  uniqueness: {case_sensitive: false},
					  format:{with: VALID_EMAIL_FORMATE}

end

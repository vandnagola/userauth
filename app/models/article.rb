class Article < ApplicationRecord
	self.per_page = 15
	belongs_to :user
	has_one_attached :file
	validates :title, presence: true
												
end

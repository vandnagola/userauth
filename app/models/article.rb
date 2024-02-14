class Article < ApplicationRecord
	self.per_page = 10
	belongs_to :user
	validates :title, presence: true
												
end

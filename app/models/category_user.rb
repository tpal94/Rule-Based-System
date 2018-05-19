class CategoryUser < ApplicationRecord
	# Associations
	belongs_to :user
	belongs_to :category
end

class Category < ApplicationRecord
	# Associations
	has_many :category_users
	has_many :users, through: :category_users
	has_many :brands
end

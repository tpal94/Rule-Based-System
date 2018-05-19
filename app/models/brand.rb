class Brand < ApplicationRecord
	# Associations
	belongs_to :category
	has_many :products
end

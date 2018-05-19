class CityUser < ApplicationRecord
	# Associations
	belongs_to :city
	belongs_to :user
end

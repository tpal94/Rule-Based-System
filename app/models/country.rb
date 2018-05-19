class Country < ApplicationRecord
	# Associations
	has_many :country_users
	has_many :users, through: :country_users
	has_many :states
	# has_many :zones
end

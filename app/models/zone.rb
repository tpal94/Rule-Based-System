class Zone < ApplicationRecord
	# Associations
	belongs_to :country
	has_many :cities
	has_many :states
	# has_many :zone_users
	# has_many :users, through: :zone_users
	has_many :stores
end

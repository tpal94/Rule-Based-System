class City < ApplicationRecord
	# Associations
	belongs_to :state
	# belongs_to :zone
	# has_many :zone_users
	has_many :users, through: :zone_users
	has_many :stores
end

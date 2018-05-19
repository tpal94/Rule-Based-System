class State < ApplicationRecord
	# Associations
	has_many :state_users
	has_many :users, through: :state_users
	belongs_to :country
	has_many :cities
end
	
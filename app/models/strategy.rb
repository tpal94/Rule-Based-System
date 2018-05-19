class Strategy < ApplicationRecord
	# Associations
	belongs_to :user
	has_many :strategy_rules, :dependent => :destroy
	has_many :rules, through: :strategy_rules
end

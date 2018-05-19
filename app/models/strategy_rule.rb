class StrategyRule < ApplicationRecord
	# Associations
	belongs_to :strategy
	belongs_to :rule
end

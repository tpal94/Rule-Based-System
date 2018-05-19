class Rule < ApplicationRecord
	has_ancestry

	# Associations
	has_many :strategy_rules
	has_many :strategies, through: :strategy_rules
end

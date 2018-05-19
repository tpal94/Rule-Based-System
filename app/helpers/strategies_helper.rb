module StrategiesHelper
	def active_upto strategy
		rule = Rule.find_by_name("Start and End date with time")
		if strategy.strategy_rules.where(rule_id: rule.id).present?
			to_date = strategy.strategy_rules.where(rule_id: rule.id).first.value["todate"].to_date.strftime("%d-%m-%Y")
		end
		return to_date
	end

	def active_from strategy
		rule = Rule.find_by_name("Start and End date with time")
		if strategy.strategy_rules.where(rule_id: rule.id).present?
			from_date = strategy.strategy_rules.where(rule_id: rule.id).first.value["fromdate"].to_date.strftime("%d-%m-%Y")
		end
		return from_date
	end
end

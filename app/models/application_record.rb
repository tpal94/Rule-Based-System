class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.create_parent_records(strategy_id,value)
		self.reflect_on_all_associations(:belongs_to).map{|p| p.name}.each do |object|
			parent_obj = object.to_s
			object_value = self.find_by_name(value.values[0])
			parent_value = object_value.send(parent_obj)
			parent_hash = {}
			parent_hash[parent_obj.camelize] = parent_value.name
			parent_obj.camelize.constantize.create_parent_records(strategy_id,parent_hash)
			rule_id = Rule.find_by_name(parent_obj.camelize).id
			strategy_rule = StrategyRule.where("value @> hstore(:key, :value)", key: parent_hash.keys[0], value: parent_hash.values[0]).where(rule_id: rule_id, strategy_id: strategy_id)
		  if strategy_rule.present?
			  strategy_rule.update(rule_id: rule_id, 
													 strategy_id: strategy_id,
													 value: parent_hash)
		  else
				strategy_rule = StrategyRule.create(rule_id: rule_id, 
																					strategy_id: strategy_id,
																					value: parent_hash)
				strategy_rule.save
			end
		end
  end
end

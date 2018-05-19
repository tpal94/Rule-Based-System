class CreateStrategyRules < ActiveRecord::Migration[5.0]
  def change
    create_table :strategy_rules do |t|
    	enable_extension "hstore"
    	t.integer :strategy_id
    	t.integer :rule_id
    	t.hstore  :value
      t.timestamps
    end
  end
end

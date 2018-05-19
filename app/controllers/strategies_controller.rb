class StrategiesController < ApplicationController
	before_action :authenticate_user! 
	include StrategiesHelper
  skip_before_filter :verify_authenticity_token, :only => [:rules_for_strategy]
	def index
		@strategies = Strategy.all
		@strategies = @strategies.where(is_drafted: true) if params[:drafted] == "true"
		@strategies = @strategies.where("lower(tag) LIKE ?", "%#{params[:tag].downcase}%") if params[:tag].present?
		filtered_strategy = []
		@strategies.each do |strategy|
			if params[:todate].present? && params[:fromdate].present?
				if (active_upto(strategy) == params[:todate].to_date.strftime("%d-%m-%Y") && 
						active_from(strategy) == params[:fromdate].to_date.strftime("%d-%m-%Y"))
					filtered_strategy << strategy
				end

				@strategies = filtered_strategy
			end
		end
	end

	def new
		@strategy = Strategy.new
		@parent_rules = Rule.roots
	end

	def create
		strategy = current_user.strategies.build
		if strategy.save
			redirect_to edit_strategy_path(strategy)
		else
			redirect_to new_strategy_path
		end
	end

	def edit
		@strategy = Strategy.find params[:id]
		@parent_rules = Rule.roots
		@strategy_rules = @strategy.rules
		@strategy_rules = [@strategy_rules.where("lower(name) LIKE ?", "%#{params[:rules][:search].downcase}%").first] if params[:rules].present?
		if @strategy_rules.compact.present?
			@display_rules_for_strategy = @strategy_rules.group_by{|p| p.parent}
		else
			@display_rules_for_strategy = []
		end
	end

	def display_strategy
		@strategy = Strategy.find params[:strategy_id]
		@strategy_rules = @strategy.rules
		# @strategy_rules = [@strategy_rules.where("lower(name) LIKE ?", "%#{params[:rules][:search].downcase}%").first] if params[:rules][:search].present?
		@display_rules_for_strategy = @strategy_rules.group_by{|p| p.parent}
	end

	def selected_rule
		@strategy = Strategy.find params[:strategy_id]
		if params[:rule_id].present?
			@rule = Rule.find(params[:rule_id])
		elsif params[:rules].present?
			@rule = Rule.where("lower(name) LIKE ?", "%#{params[:rules][:search].downcase}%").first
		end
		@parent_rule = @rule.parent
		country_rule = Rule.where(name: "Country").first
		if StrategyRule.where(rule_id: country_rule.id, strategy_id: @strategy.id).present? && @parent_rule.name == "SHOPPING BEHAVIOR"
			country_rule = Rule.where(name: "Country").first
			country_strategy_rule = StrategyRule.where(rule_id: country_rule.id, strategy_id: @strategy.id).first
			@currency = Country.where(name: country_strategy_rule.value.values[0]).first.currency
			@placeholder = true
		else
			@placeholder = false
		end

		if @rule.name == "Category" || @rule.name == "Product" || @rule.name == "Brand" || @parent_rule.name == "GEOGRAPHY" || @parent_rule.name == "GENDER BASED" || @parent_rule.name == "TIME BASED" || @parent_rule.name == "OCASSION BASED" || @parent_rule.name == "LOYAL CUSTOMER PROGRAMME"
	    # binding.pry 
	    if @rule.name == "Country"
				@selected_rule = current_user.countries 
			elsif @rule.name == "State"
				@selected_rule =  current_user.countries.collect{|p| p.states}.flatten
			elsif @rule.name == "City"
				@selected_rule =  current_user.countries.collect{|p| p.states}.flatten.map{|state| state.cities }.flatten
			elsif @rule.name == "Store"
				@selected_rule = current_user.cities.map{|p| p.stores}[0]
			elsif @rule.name == "Category"
				@selected_rule = current_user.categories
			elsif @rule.name == "Brand"
				@selected_rule = current_user.categories.collect{|p| p.brands}.flatten
			elsif @rule.name == "Product"
				@selected_rule = current_user.categories.collect{|p| p.brands}.flatten.map{|brand| brand.products }.flatten
			end
	    @design_pattern_one = true
    else
	    @design_pattern_one = false
		end
	end

	def rules_for_strategy
		rule = Rule.find params[:rule_id]
		parent_rule = rule.parent
		value = {}
		params[:rules].each do |k,v|
			value[k] = v
		end
		# parent_rule = rule.parent
		# has_multiple_value = !(parent_rule.name == "GEOGRAPHY" || rule.name == "Category" || rule.name == "Brand" || rule.name == "Product")
		# strategy_rule = StrategyRule.where(rule_id: rule.id, strategy_id: params[:strategy_id])
		if (parent_rule.name == "GEOGRAPHY" || rule.name == "Category" || rule.name == "Brand" || rule.name == "Product")
			strategy_rule = StrategyRule.where("value @> hstore(:key, :value)", key: value.keys[0], value: value.values[0]).where(rule_id: rule.id, strategy_id: params[:strategy_id])
		else
			strategy_rule = StrategyRule.where(rule_id: rule.id, strategy_id: params[:strategy_id])
		end

		if strategy_rule.present?
			strategy_rule.update(rule_id: params[:rule_id], 
													 strategy_id: params[:strategy_id],
													 value: value)
		else
			strategy_rule = StrategyRule.create(rule_id: params[:rule_id], 
																				strategy_id: params[:strategy_id],
																				value: value)
			strategy_rule.save
		end
		object_name = value.keys[0].constantize rescue ""
		object_name.create_parent_records(params[:strategy_id],value) if object_name.present?
		# object_name.reflect_on_all_associations(:belongs_to).map{|p| p.name}.each do |object|
		# 	parent_obj = object.to_s
		# 	object_value = object_name.find_by_name(value.values[0])
		# 	parent_value = object_value.send(parent_obj)
		# 	parent_hash = {}
		# 	parent_hash[parent_obj.camelize] = parent_value.name
		# 	rule_id = Rule.find_by_name(parent_obj.camelize).id
		# 	strategy_rule = StrategyRule.create(rule_id: rule_id, 
		# 																			strategy_id: params[:strategy_id],
		# 																			value: parent_hash)
		# end

		@strategy = Strategy.find params[:strategy_id]
		@display_rules_for_strategy = @strategy.rules.group_by{|p| p.parent}
	end

	def draft_strategy
		strategy = Strategy.find params[:strategy_id]
		strategy.is_drafted = true
		strategy.save
		redirect_to strategies_path(drafted: true)
	end

	def display_drafted_strategy
		@strategies = Strategy.where(is_drafted: true)
		# @strategies = @strategies.where("lower(tag) = ?", params[:tag].downcase) if params[:tag].present?
		if params[:strategy_id].present?
			@strategy = Strategy.find params[:strategy_id]
			@display_rules_for_strategy = @strategy.rules.group_by{|p| p.parent}
		end
	end

	def remove_strategy_rule
		strategy_rule = StrategyRule.where(strategy_id: params[:strategy_id], rule_id: params[:rule_id])
		strategy_rule.delete_all
	end

	def update
		strategy = Strategy.find(params[:id])
		strategy.update(name: params[:strategy][:name], tag: params[:strategy][:tag])
		redirect_to strategies_path
	end 

	def discard_strategy
		strategy = Strategy.find(params[:strategy_id])
		strategy.destroy
		redirect_to strategies_path
	end

	def destroy_multiple
		Strategy.destroy(params["strategy_ids"]) if params["strategy_ids"].present?
    respond_to do |format|
      format.html { redirect_to strategies_path }
      format.json { head :no_content }
    end
	end

	protected

	  def strategy_params
	  	params.require(:strategy).permit(:name, :tag)
	  end
end

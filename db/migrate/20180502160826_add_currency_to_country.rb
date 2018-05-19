class AddCurrencyToCountry < ActiveRecord::Migration[5.0]
  def change
  	add_column :countries, :currency, :string
  end
end

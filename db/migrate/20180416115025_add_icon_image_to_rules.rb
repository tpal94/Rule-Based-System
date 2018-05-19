class AddIconImageToRules < ActiveRecord::Migration[5.0]
  def change
  	add_column :rules, :icon_image, :string
  end
end

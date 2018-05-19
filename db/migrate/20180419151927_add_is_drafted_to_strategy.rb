class AddIsDraftedToStrategy < ActiveRecord::Migration[5.0]
  def change
  	add_column :strategies, :is_drafted, :boolean
  end
end

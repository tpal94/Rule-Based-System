class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
    	t.string :name
    	t.string :image_icon
    	t.integer :brand_id
      t.timestamps
    end
  end
end

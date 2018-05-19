class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
    	t.string :name
    	t.integer :city_id
    	t.string :image_icon
      t.timestamps
    end
  end
end

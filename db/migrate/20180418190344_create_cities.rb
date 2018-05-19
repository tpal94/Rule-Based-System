class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
    	t.string :name
    	t.integer :state_id
    	t.string :image_icon
      t.timestamps
    end
  end
end

class CreateCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :countries do |t|
    	t.string :name
    	t.string :image_icon
      t.timestamps
    end
  end
end

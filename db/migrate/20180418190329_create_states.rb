class CreateStates < ActiveRecord::Migration[5.0]
  def change
    create_table :states do |t|
    	t.string :name
    	t.integer :country_id
    	t.string :image_icon
      t.timestamps
    end
  end
end

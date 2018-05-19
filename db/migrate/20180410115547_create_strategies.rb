class CreateStrategies < ActiveRecord::Migration[5.0]
  def change
    create_table :strategies do |t|
    	t.string :name
    	t.string :tag
    	t.integer :user_id
      t.timestamps
    end
  end
end

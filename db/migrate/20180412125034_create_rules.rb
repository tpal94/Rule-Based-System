class CreateRules < ActiveRecord::Migration[5.0]
  def change
    create_table :rules do |t|
    	t.string :ancestry
    	t.string :name
      t.timestamps
    end
  end
end

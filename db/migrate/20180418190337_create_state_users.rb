class CreateStateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :state_users do |t|
    	t.integer :user_id
    	t.integer :state_id
      t.timestamps
    end
  end
end

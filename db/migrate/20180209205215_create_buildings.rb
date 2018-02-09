class CreateBuildings < ActiveRecord::Migration[5.1]
  def change
    create_table :buildings do |t|
      t.string :address
      t.string :borough
      t.integer :property_manager_id

      t.timestamps
    end
  end
end

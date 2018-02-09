class CreateLeases < ActiveRecord::Migration[5.1]
  def change
    create_table :leases do |t|
      t.integer :user_id
      t.string :property_manager_id
      t.integer :rent

      t.timestamps
    end
  end
end

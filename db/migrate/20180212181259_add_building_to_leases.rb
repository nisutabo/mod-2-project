class AddBuildingToLeases < ActiveRecord::Migration[5.1]
  def change
    add_column :leases, :building_id, :integer
  end
end

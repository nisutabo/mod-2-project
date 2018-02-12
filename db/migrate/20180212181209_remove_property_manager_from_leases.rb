class RemovePropertyManagerFromLeases < ActiveRecord::Migration[5.1]
  def change
    remove_column :leases, :property_manager_id
  end
end

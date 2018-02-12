class AddCurrentToLeases < ActiveRecord::Migration[5.1]
  def change
    add_column :leases, :current, :boolean
  end
end

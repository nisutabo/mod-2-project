class RemovePropertyManagerIdFromReviews < ActiveRecord::Migration[5.1]
  def change
    remove_column :reviews, :property_manager_id
  end
end

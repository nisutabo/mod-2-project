class AddLeaseIdToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :lease_id, :integer
  end
end

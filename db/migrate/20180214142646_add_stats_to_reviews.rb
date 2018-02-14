class AddStatsToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :response_time, :integer
    add_column :reviews, :niceness, :integer
    add_column :reviews, :value, :integer
    add_column :reviews, :accessibility, :integer
  end
end

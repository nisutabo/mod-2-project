class Building < ApplicationRecord
  belongs_to :property_manager
  has_many :leases
  has_many :users, through: :leases
  accepts_nested_attributes_for :property_manager




  private

end

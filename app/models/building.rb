class Building < ApplicationRecord
  belongs_to :property_manager
  has_many :leases
  has_many :users, through: :leases
end

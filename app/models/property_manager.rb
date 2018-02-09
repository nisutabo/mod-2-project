class PropertyManager < ApplicationRecord
  has_many :buildings
  has_many :leases, through: :buildings
  has_many :reviews
end

class Lease < ApplicationRecord
  belongs_to :building
  belongs_to :user
  has_one :review
  accepts_nested_attributes_for :building

  def get_property_manager
    self.building.property_manager.name
  end

  def property_manager_building
    "#{get_property_manager} - #{self.building.address}"
  end
end

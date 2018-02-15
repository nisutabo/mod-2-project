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

  def rating
    (self.review["niceness"] + self.review["value"] + self.review["accessibility"] + self.review["response_time"])/4.0
  end
end

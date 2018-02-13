class Review < ApplicationRecord
  belongs_to :lease
  accepts_nested_attributes_for :lease


  validates :rating, presence: true

  def lease_attributes=(att)
    pm_name = att[:building_attributes][:property_manager_attributes][:name]
    @property_manager = PropertyManager.find_or_create_by(name: pm_name)
    @building = Building.find_or_create_by(address:att[:building_attributes][:address])
    @building.update(borough:att[:building_attributes][:borough], property_manager_id:@property_manager.id)
    @lease = Lease.create(rent:att[:rent], current:att[:current], user_id:att[:user_id], building_id:@building.id)
    byebug
  end
end

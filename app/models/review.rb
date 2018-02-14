class Review < ApplicationRecord
  belongs_to :lease
  accepts_nested_attributes_for :lease


  validates :response_time, :niceness, :value, :accessibility, :content, presence: true

  validate :owner_matches_building


  def lease_attributes=(att)
    pm_name = att[:building_attributes][:property_manager_attributes][:name]
    @property_manager = PropertyManager.find_or_create_by(name: pm_name)
    @building = Building.find_or_create_by(address:att[:building_attributes][:address])
    @building.update(borough:att[:building_attributes][:borough], property_manager_id:@property_manager.id)
    @lease = Lease.create(rent:att[:rent], current:att[:current], user_id:att[:user_id], building_id:@building.id)

  end


  def rating
    (self.niceness + self.value + self.accessibility + self.response_time) / 4
  end

  # def owner_matches_building
  #   @building = lease.building
  #   @property_manager = @building.property_manager
  #
  #   @actual_building = Building.find(@building.id)
  #   if @actual_building.property_manager != @property_manager
  #   byebug
  # end




end

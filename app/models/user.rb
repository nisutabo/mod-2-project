class User < ApplicationRecord
  has_many :leases
  has_secure_password
  validates :name, uniqueness: true
  validates :name, presence: true

  def current_lease
    self.leases.find do |lease|
      lease.current == true
    end
  end

  def property_manager
    self.current_lease.building.property_manager
  end

  def all_property_managers
    self.leases.map do |lease|
      lease.building.property_manager
    end
  end

  def get_lease_from_property_manager(pm_id)
    self.leases.find do |lease|
      lease.building.property_manager_id == pm_id
    end
  end



end

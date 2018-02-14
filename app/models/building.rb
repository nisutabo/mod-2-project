class Building < ApplicationRecord
  belongs_to :property_manager
  has_many :leases
  has_many :users, through: :leases
  accepts_nested_attributes_for :property_manager



  def self.does_not_exist?(address, borough)
    found_by_addr = self.all.find_by(address: address)
    if !found_by_addr
      return true
     else
       !found_by_addr.borough == borough
     end
  end

  private

end

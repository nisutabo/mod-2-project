class Building < ApplicationRecord
  belongs_to :property_manager
  has_many :leases
  has_many :users, through: :leases
  accepts_nested_attributes_for :property_manager




  def reviewed_leases
    self.leases.select{|l|l.review != nil}
  end

  def rating
    self.reviewed_leases.map{|l| l.rating}.inject(:+) / self.reviewed_leases.size
  end





  private

end

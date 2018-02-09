class Lease < ApplicationRecord
  belongs_to :building
  belongs_to :user
  has_one :review
end

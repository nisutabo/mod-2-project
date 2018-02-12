class Review < ApplicationRecord
  belongs_to :lease
  

  validates :rating, presence: true
end

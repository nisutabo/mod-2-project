class Review < ApplicationRecord
  belongs_to :lease
  belongs_to :property_manager
end

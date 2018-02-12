class PropertyManager < ApplicationRecord
  has_many :buildings
  has_many :leases, through: :buildings
  has_many :reviews

  def average_rating
    if self.reviews
      ratings = self.reviews.map {|r| r.rating}
      ratings.inject(:+) / ratings.size
    else
      "No reviews yet"
    end
  end

  def reviews
    leases_with_reviews = self.leases.select do |lease|
      lease.review
    end
    if !leases_with_reviews.empty?
      leases_with_reviews.map {|lease| lease.review}
    end
  end

end

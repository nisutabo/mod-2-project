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

  def best_review
    max = self.reviews.map do |review|
      review.rating
    end.max
    self.reviews.find do |review|
      review.rating == max
    end
  end

  def worst_review
    min = self.reviews.map do |review|
      review.rating
    end.min
    self.reviews.find do |review|
      review.rating == min
    end
  end

end

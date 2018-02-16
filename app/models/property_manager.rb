class PropertyManager < ApplicationRecord
  has_many :buildings
  has_many :leases, through: :buildings
  has_many :reviews

  def average(att)
    if self.reviews
      ratings = self.reviews.map {|r| r[att]}
      ratings.inject(:+) / ratings.size
    else
      "No reviews yet"
    end
  end

  def leases
    self.buildings.map{|b| b.leases}.flatten
  end

  def self.highest_rated
    value = 0
    highestrated = ''
    with_reviews = PropertyManager.all.select{|pm| pm.reviews}
    with_reviews.each{|pm| value = pm.overall and highestrated = "#{pm.name} - #{pm.overall}" if pm.overall > value}
    highestrated
  end

  def self.lowest_rated
    value = 10
    lowestrated = ''
    with_reviews = PropertyManager.all.select{|pm| pm.reviews}
    with_reviews.each{|pm| value = pm.overall and lowestrated = "#{pm.name} - #{pm.overall}" if pm.overall < value}
    lowestrated
  end

  def self.most_leases
    count = 0
    most = ''
    with_reviews = PropertyManager.all.select{|pm| pm.reviews}
    with_reviews.each{|pm| count = pm.leases.size and most = "#{pm.name} - #{pm.leases.size}" if pm.leases.size > count}
    most
  end

  def average_rent
    rents = self.leases.map{|l| l.rent}
    rents.inject(:+) / rents.size
  end

  def overall
      (self.average("niceness") + self.average("value") + self.average("accessibility") + self.average("response_time")) / 4.0
    
  end

  def self.highest(att)
    num = 0
    highest = ''
    PropertyManager.all.each{|pm| num = pm.average(att) and highest = "#{pm.name} - #{pm.average(att)}"  if pm.average(att) > num}
    highest
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

  def has_brooklyn?
    !self.buildings.select{|b| b.borough == "Brooklyn"}.empty?
  end

  def brooklyn_rating
    sum = 0

    num_of_buildings = self.buildings.select{|b| b.borough == "Brooklyn"}.size
    self.buildings.each{|b| sum += b.rating if !b.leases.empty? && b.borough == "Brooklyn"}

    sum / num_of_buildings
  end


  def has_queens?
    !self.buildings.select{|b| b.borough == "Queens"}.empty?
  end

  def queens_rating
    sum = 0

    num_of_buildings = self.buildings.select{|b| b.borough == "Queens"}.size
    self.buildings.each{|b| sum += b.rating if !b.leases.empty? && b.borough == "Queens"}

    sum / num_of_buildings
  end

  def has_si?
    !self.buildings.select{|b| b.borough == "Staten Island"}.empty?
  end

  def si_rating
    sum = 0

    num_of_buildings = self.buildings.select{|b| b.borough == "Staten Island"}.size
    self.buildings.each{|b| sum += b.rating if !b.leases.empty? && b.borough == "Staten Island"}

    sum / num_of_buildings
  end


  def has_manhattan?
    !self.buildings.select{|b| b.borough == "Manhattan"}.empty?
  end

  def manhattan_rating
    sum = 0

    num_of_buildings = self.buildings.select{|b| b.borough == "Manhattan"}.size
    self.buildings.each{|b| sum += b.rating if !b.leases.empty? && b.borough == "Manhattan"}

    sum / num_of_buildings
  end


  def self.highest_per_manhattan
    max = 0
    highest = ''

    PropertyManager.all.each{|pm|
      if pm.has_manhattan?
       max = pm.manhattan_rating and highest = "#{pm.name} - #{pm.manhattan_rating}" if pm.manhattan_rating > max
      end
    }
    highest
  end

  def self.highest_per_brooklyn
    max = 0
    highest = ''

    PropertyManager.all.each{|pm|
      if pm.has_brooklyn?
       max = pm.brooklyn_rating and highest = "#{pm.name} - #{pm.brooklyn_rating}" if pm.brooklyn_rating > max
      end
    }
    highest
  end

  def self.highest_per_queens
    max = 0
    highest = ''

    PropertyManager.all.each{|pm|
      if pm.has_queens?
       max = pm.queens_rating and highest = "#{pm.name} - #{pm.queens_rating}" if pm.queens_rating > max
      end
    }
    highest
  end

  def self.highest_per_si
    max = 0
    highest = ''

    PropertyManager.all.each{|pm|
      if pm.has_si?
       max = pm.si_rating and highest = "#{pm.name} - #{pm.si_rating}" if pm.si_rating > max
      end
    }
    highest
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

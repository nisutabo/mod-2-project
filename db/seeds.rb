# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 10.times do
#   name = Faker::Name.unique.name
#   date = Faker::Date.birthday(18, 65)
#   password = Faker::Pokemon.name
#   User.create(name: name, dob: date, password: password)
# end

# 10.times do
#   name = Faker::Name.unique.name
#   @propertymanager = PropertyManager.create(name: name)
#   3.times do
#     address = Faker::Address.street_address
#     borough = ["Manhattan", "Brooklyn", "Queens", "Bronx", "Staten Island"].sample
#     @building = @propertymanager.buildings.build(address: address, borough: borough)
#     @building.save
#   end
# end

User.all.each do |user|
  building = Building.all.sample
  rent = Faker::Number.between(600,3000)
  Lease.create(user_id:user.id, building_id:building.id, rent:rent, current:true)

  building = Building.all.sample
  rent = Faker::Number.between(600,3000)
  Lease.create(user_id:user.id, building_id:building.id, rent:rent, current:false)
end

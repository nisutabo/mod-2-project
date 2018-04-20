require_relative "../../config/environment"



RSpec.describe Building do

  let(:propertymanager) {
    PropertyManager.create(
      :name => "Cavendish Properties"
    )
  }

  let(:user_a) {
    User.create(
      :name => "Chris Rock",
      :password => "tamborine",
      :dob => Date.today
    )
  }

  let(:user_b) {
    User.create(
      :name => "Dave Chappelle",
      :password => "equanimity",
      :dob => Date.today
    )
  }

  let(:building) {
    Building.create(
      :address => "91 Cavendish Square",
      :borough => "Manhattan",
      :property_manager_id => propertymanager.id
    )
  }

  let(:lease_one) {
    Lease.create(
      :rent => 2500,
      :user_id => user_a.id,
      :building_id => building.id,
      :current => true
    )
  }

  let(:lease_two) {
    Lease.create(
      :rent => 1500,
      :user_id => user_b.id,
      :building_id => building.id,
      :current => true
    )
  }

  let(:review_one) {
    Review.create(
      :content => "They think they're funny.",
      :lease_id => lease_one.id,
      :response_time => 8,
      :niceness => 4,
      :value => 5,
      :accessibility => 7
    )
  }

  let(:review_two) {
    Review.create(
      :content => "They ain't funny.",
      :lease_id => lease_two.id,
      :response_time => 8,
      :niceness => 4,
      :value => 5,
      :accessibility => 7
    )
  }


  it "it belongs to a property manager" do
    expect(building.property_manager).to eq(propertymanager)
  end

  it "can have a lease" do
    expect(building.leases).to be_truthy
  end

  it 'can have more than one lease' do
    lease_one = Lease.create(user_id: user_a.id, rent: 2500, building_id: building.id, current: true)
    lease_two = Lease.create(user_id: user_b.id, rent: 1500, building_id: building.id, current: true)
    expect(building.leases.size).to eq(2)
  end

end

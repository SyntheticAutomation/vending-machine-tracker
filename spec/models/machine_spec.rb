require 'rails_helper'

describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end
  describe 'instance methods' do
    it '.average_snack_price' do
      owner = Owner.create(name: "Sam's Snacks")
      machine_1 = owner.machines.create(location: "Harrisburg")
      snack_1 = machine_1.snacks.create(name: "Fried Tarantula", price: 500)
      snack_2 = machine_1.snacks.create(name: "Crab Cream au Gratin", price: 100)
      expect(machine_1.average_snack_price).to eq(300)
    end
  end
end

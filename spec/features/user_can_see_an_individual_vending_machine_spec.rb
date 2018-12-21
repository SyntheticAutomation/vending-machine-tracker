require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end
  it 'shows snacks and price' do
    owner = Owner.create(name: "Sam's Snacks")
    machine_1 = owner.machines.create(location: "Harrisburg")
    snack_1 = machine_1.snacks.create(name: "Fried Tarantula", price: 500)
    snack_2 = machine_1.snacks.create(name: "Crab Cream au Gratin", price: 100)
    snack_3 = machine_1.snacks.create(name: "Smores-Covered Bacon Mustard Lettuce Wraps", price: 3)

    visit machine_path(machine_1)
    expect(page).to have_content(snack_1.name)
    expect(page).to have_content(snack_1.price)
  end
end

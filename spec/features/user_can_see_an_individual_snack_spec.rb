require 'rails_helper'

describe 'A visitor who navigates to a snack show page' do
  it 'shows snack attributes' do
    owner_1 = Owner.create(name: "Sam's Snacks")
    owner_2 = Owner.create(name: "Country Vendors")
    owner_3 = Owner.create(name: "John Smith")
    machine_1 = owner_1.machines.create(location: "Johannesburg")
    machine_2 = owner_2.machines.create(location: "Shenzhen")
    machine_3 = owner_3.machines.create(location: "Moscow")
    snack_1 = machine_1.snacks.create(name: "Fried Tarantula", price: 500)
    snack_2 = machine_2.snacks.create(name: "Fried Tarantula", price: 12)
    snack_2 = machine_3.snacks.create(name: "Fried Tarantula", price: 3333)

    visit snack_path(snack_1)

    expect(page).to have_content(snack_1.name)
    expect(page).to have_content("Price: #{snack_1.price}")
    expect(page).to have_content("Found in #{machine_1.location}, #{machine_2.location}, #{machine_3.location}")
    expect(page).to have_content("Average snack cost in #{machine_1.location}: #{machine_1.average_snack_price}")
    expect(page).to have_content("Average snack cost in #{machine_2.location}: #{machine_2.average_snack_price}")
    expect(page).to have_content("Average snack cost in #{machine_3.location}: #{machine_3.average_snack_price}")
    expect(page).to have_content("Number of different snacks in #{machine_3.location}: #{machine_3.unique_snacks}")
  end
end

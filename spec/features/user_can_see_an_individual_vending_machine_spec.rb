require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end
  scenario 'they see a list of all snacks and prices in the machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons = owner.machines.create(location: "Don's Mixed Drinks")
    snack = dons.snacks.create(name: "Chips", price: 1.00)

    visit machine_path(dons)

    expect(page).to have_content("Chips")
    expect(page).to have_content(1.00)
  end
  scenario 'they see the average price of all snacks in that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons = owner.machines.create(location: "Don's Mixed Drinks")
    snack = dons.snacks.create(name: "Chips", price: 1.00)
    snack2 = dons.snacks.create(name: "Candy", price: 2.00)

    visit machine_path(dons)

    expect(page).to have_content(1.50)
  end
end

# When I visit a specific vending machine page
# I also see an average price for all of the snacks in that machine
require 'rails_helper'

feature 'When a user visits a snack show page' do
  scenario 'they see information about the snack' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    bills = owner.machines.create(location: "Bill's Food")
    snack = dons.snacks.create(name: "Chips", price: 1.00)
    snack2 = dons.snacks.create(name: "Candy", price: 2.00)
    bills.snacks << snack

    visit snack_path(snack)

    expect(page).to have_content("Chips")
    expect(page).to have_content(1.00)
    expect(page).to have_content("Don's Mixed Drinks")
    expect(page).to have_content(1.50)
    expect(page).to have_content(2)
    expect(page).to have_content("Bill's Food")
    expect(page).to have_content(1)
  end
end
# As a user
# When I visit a specific snack page
# I see the name of that snack
# I see the price for that snack
# I see a list of locations with vending machines that carry that snack
# I see the average price for snacks in those vending machines
# And I see a count of the different kinds of items in that vending machine.
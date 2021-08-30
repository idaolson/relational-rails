require 'rails_helper'

RSpec.describe "restaurant-parent show" do
  before(:each) do
    @rest_1 = Restaurant.create!(
      name: "Geraldo's",
      delivery: true,
      michelin_stars: 3,
      )
    @rest_2 = Restaurant.create!(
      name: "Gambardella's",
      delivery: false,
      michelin_stars: 1,
      )
    @pasta_1 = Pasta.create!({
      name: "rigatoni",
      is_vegan: false,
      price: 6.99,
      restaurant_id: @rest_1.id,
      })
    @pasta_2 = Pasta.create!({
      name: "bucatini",
      is_vegan: true,
      price: 7.99,
      restaurant_id: @rest_1.id,
      })
    @pasta_3 = Pasta.create!({
      name: "strozzapreti",
      is_vegan: false,
      price: 5.99,
      restaurant_id: @rest_2.id,
      })
  end

  # User Story 12
  it "can update an existing restaurant's attributes" do
    visit "/restaurants/#{@rest_1.id}"
    expect(has_link?('Update Restaurant')).to eq(true)

    click_on 'Update Restaurant'
    expect(current_path).to eq("/restaurants/#{@rest_1.id}/edit")

    fill_in :name, with: 'Olive Garden'
    check :delivery
    fill_in :michelin_stars, with: '0'

    click_button 'Update Restaurant'
    expect(current_path).to eq('/restaurants')
    expect(page).to have_content('Olive Garden')
    expect(page).to have_no_content("Geraldo's")
  end
end

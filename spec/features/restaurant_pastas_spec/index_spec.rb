require 'rails_helper'

RSpec.describe "restaurant-parent index" do
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

  # User Story 10
  it "shows link to a restaurant's pastas on restaurant's show page" do
    visit "/restaurants/#{@rest_1.id}"

    expect(has_link?("Pasta Menu")).to eq(true)
  end

  # User Story 5
  it "displays a restaurant's pasta menu with attributes" do
    visit "/restaurants/#{@rest_1.id}/pastas"
        # save_and_open_page
    expect(page).to have_content(@pasta_1.id)
    expect(page).to have_content(@pasta_1.created_at)
    expect(page).to have_content(@pasta_1.updated_at)
    expect(page).to have_content(@pasta_1.name)
    expect(page).to have_content(@pasta_1.is_vegan)
    expect(page).to have_content(@pasta_1.price)
    expect(page).to have_content(@pasta_1.restaurant_id)

    expect(page).to have_content(@pasta_2.name)
    expect(page).to have_content(@pasta_2.id)
    expect(page).to have_content(@pasta_2.created_at)
    expect(page).to have_content(@pasta_2.updated_at)
    expect(page).to have_content(@pasta_2.is_vegan)
    expect(page).to have_content(@pasta_2.price)
    expect(page).to have_content(@pasta_2.restaurant_id)

    visit "/restaurants/#{@rest_2.id}/pastas"

    expect(page).to have_content(@pasta_3.name)
    expect(page).to have_content(@pasta_3.id)
    expect(page).to have_content(@pasta_3.created_at)
    expect(page).to have_content(@pasta_3.updated_at)
    expect(page).to have_content(@pasta_3.is_vegan)
    expect(page).to have_content(@pasta_3.price)
    expect(page).to have_content(@pasta_3.restaurant_id)
  end

  # User Story 16
  it 'has a link to sort pastas by name' do
    visit "/restaurants/#{@rest_1.id}/pastas"
    expect(has_link?("Sort By Pasta Name")).to eq(true)
    expect(@pasta_1.name).to appear_before(@pasta_2.name)

    click_link "Sort By Pasta Name"
    expect(current_path).to eq("/restaurants/#{@rest_1.id}/pastas")
    expect(@pasta_2.name).to appear_before(@pasta_1.name)
  end

  # User Story 21
  it "allows input to return records that meet a criteria" do
    visit "/restaurants/#{@rest_1.id}/pastas"
    expect(page).to have_content("Only Return Records That Cost More Than:")

    fill_in :price, with: "7.01"
    click_button "submit"

    expect(current_path).to eq("/restaurants/#{@rest_1.id}/pastas")
    expect(page).to have_no_content(@pasta_1.name)
    expect(page).to have_content(@pasta_2.name)
  end
end

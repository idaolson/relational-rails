require 'rails_helper'

RSpec.describe "pasta-child index" do
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

  # User Story 3
  it "displays index of pastas with attributes" do
    visit "/pastas.index"
        # save_and_open_page
    expect(page).to have_content(@pasta_1.name)
    expect(page).to have_content(@pasta_1.id)
    expect(page).to have_content(@pasta_1.created_at)
    expect(page).to have_content(@pasta_1.updated_at)
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

    expect(page).to have_content(@pasta_3.name)
    expect(page).to have_content(@pasta_3.id)
    expect(page).to have_content(@pasta_3.created_at)
    expect(page).to have_content(@pasta_3.updated_at)
    expect(page).to have_content(@pasta_3.is_vegan)
    expect(page).to have_content(@pasta_3.price)
    expect(page).to have_content(@pasta_3.restaurant_id)
  end

  # User Story 4
  it "displays pasta attributes on id page" do

    visit "/pastas/#{@pasta_1.id}"
        # save_and_open_page
    expect(page).to have_content(@pasta_1.id)
    expect(page).to have_content(@pasta_1.created_at)
    expect(page).to have_content(@pasta_1.updated_at)
    expect(page).to have_content(@pasta_1.name)
    expect(page).to have_content(@pasta_1.is_vegan)
    expect(page).to have_content(@pasta_1.price)
    expect(page).to have_content(@pasta_1.restaurant_id)
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

  # User Story 8
  it 'is linked to from every page' do
    visit "/"
    expect(has_link?("Pastas")).to eq(true)

    visit "/restaurants"
    expect(has_link?("Pastas")).to eq(true)

    visit "/restaurants/#{@rest_1.id}"
    expect(has_link?("Pastas")).to eq(true)

    visit "/pastas"
    expect(has_link?("Pastas")).to eq(true)

    visit "/pastas/#{@pasta_1.id}"
    expect(has_link?("Pastas")).to eq(true)

    visit "/restaurants/#{@rest_1.id}/pastas"
    expect(has_link?("Pastas")).to eq(true)
  end
end

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

  # User Story 3 & updated for User Story 15
  it "displays index of pastas with attributes only if vegan" do
    visit "/pastas"
    # expect(page).to have_content(@pasta_1.name)
    # expect(page).to have_content(@pasta_1.id)
    # expect(page).to have_content(@pasta_1.created_at)
    # expect(page).to have_content(@pasta_1.updated_at)
    # expect(page).to have_content(@pasta_1.is_vegan)
    # expect(page).to have_content(@pasta_1.price)
    # expect(page).to have_content(@pasta_1.restaurant_id)

    expect(page).to have_no_content(@pasta_1.name)
    expect(page).to have_no_content(@pasta_3.name)


    expect(page).to have_content(@pasta_2.name)
    expect(page).to have_content(@pasta_2.id)
    expect(page).to have_content(@pasta_2.created_at)
    expect(page).to have_content(@pasta_2.updated_at)
    expect(page).to have_content(@pasta_2.is_vegan)
    expect(page).to have_content(@pasta_2.price)
    expect(page).to have_content(@pasta_2.restaurant_id)

    # expect(page).to have_content(@pasta_3.name)
    # expect(page).to have_content(@pasta_3.id)
    # expect(page).to have_content(@pasta_3.created_at)
    # expect(page).to have_content(@pasta_3.updated_at)
    # expect(page).to have_content(@pasta_3.is_vegan)
    # expect(page).to have_content(@pasta_3.price)
    # expect(page).to have_content(@pasta_3.restaurant_id)
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

  # User Story 18
  it "can update an existing pasta's attributes" do
    visit "/pastas"
    expect(has_link?("Update #{@pasta_2.name}")).to eq(true)

    click_on "Update #{@pasta_2.name}"
    expect(current_path).to eq("/pastas/#{@pasta_2.id}/edit")

    fill_in :name, with: 'macaroni'
    check :is_vegan
    fill_in :price, with: '19.97'

    click_button 'Update Pasta'
    expect(current_path).to eq("/pastas/#{@pasta_2.id}")
    expect(page).to have_content('macaroni')
    expect(page).to have_no_content("rigatoni")
  end

  # User Story 23
  it 'has link to delete pasta' do
    visit "/pastas"
    expect(has_link?("Delete #{@pasta_2.name}")).to eq(true)

    click_on "Delete #{@pasta_2.name}"
    expect(current_path).to eq("/pastas")
    expect(page).to have_no_content("bucatini")
  end
end

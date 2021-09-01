require 'rails_helper'

RSpec.describe "pasta-child show" do
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

  # User Story 14
  it "can update an existing pasta's attributes" do
    visit "/pastas/#{@pasta_1.id}"
    expect(has_link?('Update Pasta')).to eq(true)

    click_on 'Update Pasta'
    expect(current_path).to eq("/pastas/#{@pasta_1.id}/edit")

    fill_in :name, with: 'macaroni'
    check :is_vegan
    fill_in :price, with: '19.97'

    click_button 'Update Pasta'
    expect(current_path).to eq("/pastas/#{@pasta_1.id}")
    expect(page).to have_content('macaroni')
    expect(page).to have_no_content("rigatoni")
  end

  # User Story 20
  it 'has link to delete pasta' do
    visit "/pastas/#{@pasta_2.id}"
    expect(has_link?("Delete Pasta")).to eq(true)

    click_on "Delete Pasta"
    expect(current_path).to eq("/pastas")
    expect(page).to have_no_content("bucatini")
  end
end

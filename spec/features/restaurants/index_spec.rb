require 'rails_helper'

RSpec.describe "restaurant index" do
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
  end

  it "can show restaurant names on idex page" do
    #
    # User Story 1, Parent Index (x2)
    #
    # For each parent table
    # As a visitor
    # When I visit '/parents'
    # Then I see the name of each parent record in the system
    visit '/restaurants'
    expect(page).to have_content(@rest_1.name)
    expect(page).to have_content(@rest_2.name)
  end

  it "displays restaurant attributes on id page" do

    visit "/restaurants/#{@rest_1.id}"
        save_and_open_page
    expect(page).to have_content(@rest_1.id)
    expect(page).to have_content(@rest_1.created_at)
    expect(page).to have_content(@rest_1.updated_at)
    expect(page).to have_content(@rest_1.name)
    expect(page).to have_content(@rest_1.delivery)
    expect(page).to have_content(@rest_1.michelin_stars)
  end
end

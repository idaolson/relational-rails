require 'rails_helper'

RSpec.describe 'restaurant-parent index' do
  before(:each) do
    @rest_1 = Restaurant.create!(
      name: "Geraldo's",
      delivery: true,
      michelin_stars: 3
    )
    @rest_2 = Restaurant.create!(
      name: "Gambardella's",
      delivery: false,
      michelin_stars: 1
    )
    @pasta_1 = Pasta.create!({
                               name: 'rigatoni',
                               is_vegan: false,
                               price: 6.99,
                               restaurant_id: @rest_1.id
                             })
    @pasta_2 = Pasta.create!({
                               name: 'bucatini',
                               is_vegan: true,
                               price: 7.99,
                               restaurant_id: @rest_1.id
                             })
    @pasta_3 = Pasta.create!({
                               name: 'strozzapreti',
                               is_vegan: false,
                               price: 5.99,
                               restaurant_id: @rest_2.id
                             })
  end

  # User Story 1
  it 'can show restaurant names on idex page' do
    visit '/restaurants'
    expect(page).to have_content(@rest_1.name)
    expect(page).to have_content(@rest_2.name)
  end

  # User Story 2
  it 'displays restaurant attributes on id page' do
    visit "/restaurants/#{@rest_1.id}"
    expect(page).to have_content(@rest_1.id)
    expect(page).to have_content(@rest_1.created_at)
    expect(page).to have_content(@rest_1.updated_at)
    expect(page).to have_content(@rest_1.name)
    expect(page).to have_content(@rest_1.delivery)
    expect(page).to have_content(@rest_1.michelin_stars)
  end

  # User Story 6
  it 'sorts records on restaurant index by most recently created ' do
    visit '/restaurants'
    expect(@rest_2.name).to appear_before(@rest_1.name)
    expect(page).to have_content(@rest_1.created_at)
    expect(page).to have_content(@rest_1.created_at)
  end

  # User Story 7
  it "shows a count of number of pastas on restaurant's show page" do
    visit "/restaurants/#{@rest_1.id}"
    expect(page).to have_content(@rest_1.pasta_count)

    visit "/restaurants/#{@rest_2.id}"
    expect(page).to have_content(@rest_2.pasta_count)
  end

  # User Story 9
  it 'is linked to from every page' do
    visit '/'
    expect(has_link?('Restaurants')).to eq(true)

    visit '/restaurants'
    expect(has_link?('Restaurants')).to eq(true)

    visit "/restaurants/#{@rest_1.id}"
    expect(has_link?('Restaurants')).to eq(true)

    visit '/pastas'
    expect(has_link?('Restaurants')).to eq(true)

    visit "/pastas/#{@pasta_1.id}"
    expect(has_link?('Restaurants')).to eq(true)

    visit "/restaurants/#{@rest_1.id}/pastas"
    expect(has_link?('Restaurants')).to eq(true)
  end

  # User Story 11
  it 'has a link to create a new restaurant' do
    visit '/restaurants'

    expect(has_link?('New Restaurant')).to eq(true)

    click_on 'New Restaurant'
    expect(current_path).to eq('/restaurants/new')

    fill_in :name, with: 'Olive Garden'
    check :delivery
    fill_in :michelin_stars, with: '0'

    click_button 'Create Restaurant'
    expect(current_path).to eq('/restaurants')
    expect(page).to have_content('Olive Garden')
  end




end

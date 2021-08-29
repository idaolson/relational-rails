require 'rails_helper'

describe 'boba shops index page' do
  before(:each) do
    @store_1 = BobaShop.create!(
      name: 'Sharetea',
      drive_thru: false,
      capacity: 25
    )
    @store_2 = BobaShop.create!(
      name: 'Cha4Tea',
      drive_thru: false,
      capacity: 25
    )
    @drink_1 = @store_1.drinks.create!(
      name: 'Okinawan Milk Tea',
      in_stock: true,
      price: 6.99
    )
    @drink_2 = @store_1.drinks.create!(
      name: 'Hazelnut Milk Tea',
      in_stock: true,
      price: 6.99
    )
    @drink_3 = @store_2.drinks.create!(
      name: 'Honey Milk Tea',
      in_stock: true,
      price: 6.99
    )
    @drink_4 = @store_2.drinks.create!(
      name: 'Taro Milk Tea',
      in_stock: true,
      price: 6.99
    )
  end

  it 'shows all boba shops' do
    visit "/boba_shops"

    expect(page).to have_content(@store_1.name)
    expect(page).to have_content(@store_2.name)
  end

  it 'sorts by the most recently created' do
    visit "/boba_shops"

    expect(@store_2.name).to appear_before(@store_1.name)
  end
  
  it 'can be redirected to from any page' do
    visit "/"
    expect(has_link?("Boba Shops")).to eq(true)

    visit "/boba_shops"
    expect(has_link?("Boba Shops")).to eq(true)
    
    visit "/boba_shops/#{@store_1.id}"
    expect(has_link?("Boba Shops")).to eq(true)
    
    visit "/drinks"
    expect(has_link?("Boba Shops")).to eq(true)

    visit "/drinks/#{@drink_1.id}"
    expect(has_link?("Boba Shops")).to eq(true)
    
    visit "/boba_shops/#{@store_1.id}/drinks"
    expect(has_link?("Boba Shops")).to eq(true)
  end

  it 'has a link to to create a new boba shop' do
    visit "/boba_shops"
    expect(has_link?("New Boba Shop")).to eq(true)
    
    click_on "New Boba Shop"
    expect(current_path).to eq("/boba_shops/new")

    fill_in :name , with: 'Tea Station'
    choose :drive_thru_false
    fill_in :capacity, with: '30'

    click_button "Create New Boba Shop"
    expect(current_path).to eq("/boba_shops")
    expect(page).to have_content("Tea Station")
  end

  it 'has a link to update each boba shop' do
    visit "/boba_shops"
    expect(has_link?("Update #{@store_1.name}")).to eq(true)

    click_on "Update #{@store_1.name}"
    expect(current_path).to eq("/boba_shops/#{@store_1.id}/edit")
  end
end
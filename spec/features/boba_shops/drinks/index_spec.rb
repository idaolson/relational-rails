require 'rails_helper'

describe 'drinks by shop page' do
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

  it 'shows drinks that are associated with its boba shop' do
    visit "/boba_shops/#{@store_2.id}/drinks"

    expect(page).to have_content(@drink_3.id)
    expect(page).to have_content(@drink_3.created_at)
    expect(page).to have_content(@drink_3.updated_at)
    expect(page).to have_content(@drink_3.name)
    expect(page).to have_content(@drink_3.in_stock)
    expect(page).to have_content(@drink_3.price)

    expect(page).to have_content(@drink_4.id)
    expect(page).to have_content(@drink_4.created_at)
    expect(page).to have_content(@drink_4.updated_at)
    expect(page).to have_content(@drink_4.name)
    expect(page).to have_content(@drink_4.in_stock)
    expect(page).to have_content(@drink_4.price)
  end

  it 'has a link to add a new drink' do
    visit "/boba_shops/#{@store_1.id}/drinks"
    expect(has_link?("Create Drink")).to eq(true)

    click_link "Create Drink"
    expect(current_path).to eq("/boba_shops/#{@store_1.id}/drinks/new")

    fill_in :name, with: 'Jasmine Milk Tea'
    choose :in_stock_true
    fill_in :price, with: '7.99'

    click_button "Create New Drink"
    expect(current_path).to eq("/boba_shops/#{@store_1.id}/drinks")
  end

  it 'has a link to sort drinks by alphabetical order' do
    visit "/boba_shops/#{@store_1.id}/drinks"
    expect(has_link?("Sort")).to eq(true)

    click_link "Sort"
    expect(current_path).to eq("/boba_shops/#{@store_1.id}/drinks")
    expect(@drink_2.name).to appear_before(@drink_1.name)
  end
end
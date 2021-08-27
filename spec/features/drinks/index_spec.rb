require 'rails_helper'

describe 'drinks index page' do
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

  it 'shows all drinks with their attributes' do
    visit "/drinks"

    expect(page).to have_content(@drink_1.id)
    expect(page).to have_content(@drink_1.boba_shop_id)
    expect(page).to have_content(@drink_1.created_at)
    expect(page).to have_content(@drink_1.updated_at)
    expect(page).to have_content(@drink_1.in_stock)
    expect(page).to have_content(@drink_1.price)

    expect(page).to have_content(@drink_2.id)
    expect(page).to have_content(@drink_2.boba_shop_id)
    expect(page).to have_content(@drink_2.created_at)
    expect(page).to have_content(@drink_2.updated_at)
    expect(page).to have_content(@drink_2.in_stock)
    expect(page).to have_content(@drink_2.price)

    expect(page).to have_content(@drink_3.id)
    expect(page).to have_content(@drink_3.boba_shop_id)
    expect(page).to have_content(@drink_3.created_at)
    expect(page).to have_content(@drink_3.updated_at)
    expect(page).to have_content(@drink_3.in_stock)
    expect(page).to have_content(@drink_3.price)

    expect(page).to have_content(@drink_4.id)
    expect(page).to have_content(@drink_4.boba_shop_id)
    expect(page).to have_content(@drink_4.created_at)
    expect(page).to have_content(@drink_4.updated_at)
    expect(page).to have_content(@drink_4.in_stock)
    expect(page).to have_content(@drink_4.price)
  end

  it 'can be redirected to from any page' do
    visit "/"
    expect(has_link?("Drinks")).to eq(true)

    visit "/boba_shops"
    expect(has_link?("Drinks")).to eq(true)
    
    visit "/boba_shops/#{@store_1.id}"
    expect(has_link?("Drinks")).to eq(true)
    
    visit "/drinks"
    expect(has_link?("Drinks")).to eq(true)
    
    visit "/drinks/#{@drink_1.id}"
    expect(has_link?("Drinks")).to eq(true)

    visit "/boba_shops/#{@store_1.id}/drinks"
    expect(has_link?("Drinks")).to eq(true)
  end
end
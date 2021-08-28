require 'rails_helper'

describe 'boba shop drinks page' do
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

  it "can see the its drink's attributes" do
    visit "/boba_shops/#{@store_1.id}/drinks"

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
  end

  it 'has a link that redirects to the boba shop' do
    visit "/boba_shops/#{@store_1.id}"
    expect(has_link?("View Drinks")).to eq(true)
    
    click_on "View Drinks"
    expect(current_path).to eq("/boba_shops/#{@store_1.id}/drinks")
  end

  it 'has a link to update a drink from a boba shop' do
    visit "/boba_shops/#{@store_1.id}/drinks"
    expect(has_link?("Update #{@drink_1.name}")).to eq(true)
    
    click_on "Update #{@drink_1.name}"
    expect(current_path).to eq("/boba_shops/#{@store_1.id}/drinks/#{@drink_1.id}/edit")

    fill_in :name, with: 'Hokkaido Milk Tea'
    choose :in_stock_true
    fill_in :price, with: '7.99'

    click_on "Update #{@drink_1.name}"
    expect(current_path).to eq("/boba_shops/#{@store_1.id}/drinks")
  end

  it 'has a link to delete a drink from a boba shop' do
    visit "/boba_shops/#{@store_1.id}/drinks/#{@drink_1.id}"
    expect(has_link?("Delete #{@drink_1.name}")).to eq(true)

    click_on "Delete #{@drink_1.name}"
    expect(has_no_content?("#{@drink_1.name}")).to eq(true)
  end
end
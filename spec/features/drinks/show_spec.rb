require 'rails_helper'

describe 'drinks show page' do
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

  it 'shows a drink with its attributes' do
    visit "/drinks/#{@drink_1.id}"

    expect(page).to have_content(@drink_1.id)
    expect(page).to have_content(@drink_1.boba_shop_id)
    expect(page).to have_content(@drink_1.created_at)
    expect(page).to have_content(@drink_1.updated_at)
    expect(page).to have_content(@drink_1.in_stock)
    expect(page).to have_content(@drink_1.price)
  end

  it 'has a link to update drinks' do
    visit "/drinks/#{@drink_2.id}"
    expect(has_link?("Update #{@drink_2.name}")).to eq(true)

    click_on "Update #{@drink_2.name}"
    expect(current_path).to eq("/drinks/#{@drink_2.id}/edit")

    fill_in :name, with: 'Hokkaido Milk Tea'
    choose :in_stock_false
    fill_in :price, with: 8.99

    click_on "Update #{@drink_2.name}"
    save_and_open_page
    expect(current_path).to eq("/drinks/#{@drink_2.id}")
  end
end
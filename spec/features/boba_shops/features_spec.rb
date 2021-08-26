require 'rails_helper'
require 'date'

RSpec.describe 'boba shops' do
  before(:each) do
    @store_1 = BobaShop.create!(
      id: 1,
      created_at: Date.today.strftime('%d%m%y'),
      updated_at: Date.today.strftime('%d%m%y'),
      name: 'Sharetea',
      drive_thru: false,
      capacity: 25
    )
    @store_2 = BobaShop.create!(
      id: 2,
      created_at: Date.today.strftime('%d%m%y'),
      updated_at: Date.today.strftime('%d%m%y'),
      name: 'Cha4Tea',
      drive_thru: false,
      capacity: 25
    )
    @drink_1 = @store_1.drinks.create!(
      id: 1,
      created_at: Date.today.strftime('%d%m%y'),
      updated_at: Date.today.strftime('%d%m%y'),
      name: 'Okinawan Milk Tea',
      in_stock: true,
      price: 6.99
    )
    @drink_2 = @store_1.drinks.create!(
      id: 2,
      created_at: Date.today.strftime('%d%m%y'),
      updated_at: Date.today.strftime('%d%m%y'),
      name: 'Hazelnut Milk Tea',
      in_stock: true,
      price: 6.99
    )
    @drink_3 = @store_2.drinks.create!(
      id: 3,
      created_at: Date.today.strftime('%d%m%y'),
      updated_at: Date.today.strftime('%d%m%y'),
      name: 'Honey Milk Tea',
      in_stock: true,
      price: 6.99
    )
    @drink_4 = @store_2.drinks.create!(
      id: 4,
      created_at: Date.today.strftime('%d%m%y'),
      updated_at: Date.today.strftime('%d%m%y'),
      name: 'Taro Milk Tea',
      in_stock: true,
      price: 6.99
    )
  end
  
  it 'can see all boba shops' do
    visit '/boba_shops'

    expect(page).to have_content(@store_1.name)
  end

  it 'can see the boba shops attributes by id' do
    visit "/boba_shops/#{@store_1.id}"

    expect(page).to have_content(@store_1.id)
    expect(page).to have_content(@store_1.created_at)
    expect(page).to have_content(@store_1.updated_at)
    expect(page).to have_content(@store_1.drive_thru)
    expect(page).to have_content(@store_1.capacity)
  end

  it 'can see the drinks attributes' do
    visit "/drinks"

    expect(page).to have_content(@drink_1.id)
    expect(page).to have_content(@drink_1.created_at)
    expect(page).to have_content(@drink_1.updated_at)
    expect(page).to have_content(@drink_1.in_stock)
    expect(page).to have_content(@drink_1.price)
    expect(page).to have_content(@drink_2.id)
    expect(page).to have_content(@drink_2.created_at)
    expect(page).to have_content(@drink_2.updated_at)
    expect(page).to have_content(@drink_2.in_stock)
    expect(page).to have_content(@drink_2.price)
  end

  it 'can see the drink attributes by id' do
    visit "/drinks/#{@drink_1.id}"

    expect(page).to have_content(@drink_1.id)
    expect(page).to have_content(@drink_1.created_at)
    expect(page).to have_content(@drink_1.updated_at)
    expect(page).to have_content(@drink_1.in_stock)
    expect(page).to have_content(@drink_1.price)
  end

  it 'can see each drink that is associated with that boba shop' do
    visit "/boba_shops/#{@store_2.id}/drinks"
    save_and_open_page

    expect(page).to have_content(@drink_3.id)
    expect(page).to have_content(@drink_3.created_at)
    expect(page).to have_content(@drink_3.updated_at)
    expect(page).to have_content(@drink_3.in_stock)
    expect(page).to have_content(@drink_3.price)
    expect(page).to have_content(@drink_4.id)
    expect(page).to have_content(@drink_4.created_at)
    expect(page).to have_content(@drink_4.updated_at)
    expect(page).to have_content(@drink_4.in_stock)
    expect(page).to have_content(@drink_4.price)
  end

  it 'can sort by the most recently created' do
    visit "/boba_shops"

    within '#index' do
      
    end
  end
end
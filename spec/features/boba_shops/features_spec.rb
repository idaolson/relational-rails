require 'rails_helper'
require 'date'

describe 'boba shops' do
  before(:each) do
    @time = DateTime.now
    @store_1 = BobaShop.create!(
      id: 1,
      created_at: @time.strftime('%d%m%y %H:%M:%S'),
      updated_at: @time.strftime('%d%m%y %H:%M:%S'),
      name: 'Sharetea',
      drive_thru: false,
      capacity: 25
    )
    @store_2 = BobaShop.create!(
      id: 2,
      created_at: (@time + 1.hour).strftime('%d%m%y %H:%M:%S'),
      updated_at: (@time + 1.hour).strftime('%d%m%y %H:%M:%S'),
      name: 'Cha4Tea',
      drive_thru: false,
      capacity: 25
    )
    @drink_1 = @store_1.drinks.create!(
      id: 1,
      created_at: @time.strftime('%d%m%y %H:%M:%S'),
      updated_at: @time.strftime('%d%m%y %H:%M:%S'),
      name: 'Okinawan Milk Tea',
      in_stock: true,
      price: 6.99
    )
    @drink_2 = @store_1.drinks.create!(
      id: 2,
      created_at: @time.strftime('%d%m%y %H:%M:%S'),
      updated_at: @time.strftime('%d%m%y %H:%M:%S'),
      name: 'Hazelnut Milk Tea',
      in_stock: true,
      price: 6.99
    )
    @drink_3 = @store_2.drinks.create!(
      id: 3,
      created_at: (@time + 1.hour).strftime('%d%m%y %H:%M:%S'),
      updated_at: (@time + 1.hour).strftime('%d%m%y %H:%M:%S'),
      name: 'Honey Milk Tea',
      in_stock: true,
      price: 6.99
    )
    @drink_4 = @store_2.drinks.create!(
      id: 4,
      created_at: (@time + 1.hour).strftime('%d%m%y %H:%M:%S'),
      updated_at: (@time + 1.hour).strftime('%d%m%y %H:%M:%S'),
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

    expect(page).to have_css('#boba_shop-2~#boba_shop-1')
  end

  it 'can count number of drinks associated with the boba shop' do
    visit "/boba_shops/#{@store_1.id}"

    expect(page).to have_content("count: 2")
  end

  it 'has a link that redirects back to the drinks index' do
    visit "/"

    page.has_xpath?("/drinks")

    visit "/boba_shops"

    page.has_xpath?("/drinks")
    
    visit "/boba_shops/#{@store_1.id}"

    page.has_xpath?("/drinks")
    
    visit "/drinks"

    page.has_xpath?("/drinks")
    
    visit "/drinks/#{@drink_1.id}"

    page.has_xpath?("/drinks")

    visit "/boba_shops/#{@store_1.id}/drinks"

    page.has_xpath?("/drinks")
  end

  it 'has a link that redirects back to the boba shops index' do
    visit "/"

    page.has_xpath?("/boba_shops")

    visit "/boba_shops"

    page.has_xpath?("/boba_shops")
    
    visit "/boba_shops/#{@store_1.id}"

    page.has_xpath?("/boba_shops")
    
    visit "/drinks"

    page.has_xpath?("/boba_shops")

    visit "/drinks/#{@drink_1.id}"

    page.has_xpath?("/boba_shops")
    
    visit "/boba_shops/#{@store_1.id}/drinks"

    page.has_xpath?("/boba_shops")
  end

  it 'has a link that redirects to the boba shops drinks' do
    visit "/boba_shops/#{@store_1.id}"
    click_on "View Drinks"

    expect(page).to have_current_path("/boba_shops/#{@store_1.id}/drinks")
  end
end